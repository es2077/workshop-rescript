open AncestorSpacy
open ReScriptUrql

module HomeQuery = %graphql(`
  query HomeQuery {
    post_connection(first: 1000) {
      edges {
        cursor
        node {
          id
          title
          body
          author
          claps
          created_at
        }
      }
    }
  }
`)

@react.component
let make = () => {
  let ({Hooks.response: response}, _executeQuery) = Hooks.useQuery(~query=module(HomeQuery), ())

  <Box mt=[xs(7)]>
    <Box display=[xs(#flex)] justifyContent=[xs(#"flex-end")]>
      <Next.Link href="/new-post"> <Button> "New post" </Button> </Next.Link>
    </Box>
    <Box mt=[xs(4)]>
      {switch response {
      | Fetching => React.string("Fetching...")
      | Empty => React.string("Nothing")
      | Error(error) => React.string(error.message)
      | PartialData(data, _)
      | Data(data) =>
        let {post_connection: {edges: posts}} = data

        posts
        ->Belt.Array.map(({node}) => {
          <PostItem
            key={node.id}
            title=node.title
            body=node.body
            authorName={node.author->Belt.Option.getWithDefault("")}
            claps={node.claps->Belt.Option.getWithDefault(0)}
            date={node.created_at
            ->Belt.Option.getWithDefault("")
            ->Js.Date.fromString
            ->DateFns.format("dd/MM/yyyy")}
            slug={node.id}
          />
        })
        ->React.array
      }}
    </Box>
  </Box>
}
