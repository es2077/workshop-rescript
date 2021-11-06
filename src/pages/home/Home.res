open AncestorSpacy
open ReScriptUrql

module HomeQuery = %graphql(`
  query HomeQuery {
    post_connection(
      first: 1000
    ) {
      edges {
        cursor
        node {
          id
          title
          body
        }
      }
    }
  }
`)

@react.component
let make = () => {
  let ({Hooks.response: response}, executeQuery) = Hooks.useQuery(~query=module(HomeQuery), ())

  <Box mt=[xs(7)]>
    <Box display=[xs(#flex)] justifyContent=[xs(#"flex-end")]>
      //
      <Next.Link href="/new-post"> <Button> "New post" </Button> </Next.Link>
    </Box>
    <Box mt=[xs(4)]>
      {switch response {
      | Fetching => React.string("Fetching...")
      | Empty => React.string("Nothing")
      | Error(error) => React.string(error.message)
      | PartialData(data, _)
      | Data(data) => {
          let {post_connection: {edges: posts}} = data
          <Box>
            {posts
            ->Belt.Array.map(({node: {id, title, body}}) => {
              <PostItem title body slug={id} authorName=`Marcos` claps=200 date=`May 21, 2021` />
            })
            ->React.array}
          </Box>
        }
      }}
      <PostItem
        title=`My tweet blew up, what should I do?`
        body=`I recently started using HypeFury to post tweets regularly. The idea is to build my audience (of Indie Hackers and creators) and hopef...`
        slug=`my-tweet`
        authorName=`Marcos`
        claps=200
        date=`May 21, 2021`
      />
      <PostItem
        title=`My tweet blew up, what should I do?`
        body=`I recently started using HypeFury to post tweets regularly. The idea is to build my audience (of Indie Hackers and creators) and hopef...`
        slug=`my-tweet`
        authorName=`Marcos`
        claps=200
        date=`May 21, 2021`
      />
      <PostItem
        title=`My tweet blew up, what should I do?`
        body=`I recently started using HypeFury to post tweets regularly. The idea is to build my audience (of Indie Hackers and creators) and hopef...`
        slug=`my-tweet`
        authorName=`Marcos`
        claps=200
        date=`May 21, 2021`
      />
    </Box>
  </Box>
}
