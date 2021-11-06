open ReScriptUrql
open Ancestor.Default
open Theme
open Render

module PostQuery = %graphql(`
  query PostQuery($id: ID!) {
    node(id: $id) {
      ... on post {
        id
        title
        body
      }
    }
  }
`)

@react.component
let make = () => {
  let a = Next.Router.useRouter()
  let ({Hooks.response: response}, _executeQuery) = Hooks.useQuery(
    ~query=module(PostQuery),
    {
      {id: a.query["slug"]}
    },
  )

  <div>
    {switch response {
    | PartialData({node: Some(#post(post))}, _)
    | Data({node: Some(#post(post))}) => <>
        <Typography
          tag=#h1
          m=[xs(0)]
          mb=[xs(2)]
          fontSize=[xs(2.4->#rem)]
          letterSpacing=[xs(-0.02->#rem)]
          color=[xs(Colors.black)]>
          {post.title->s}
        </Typography>
        <Typography
          tag=#p
          m=[xs(0)]
          mb=[xs(2)]
          fontSize=[xs(1.8->#rem)]
          lineHeight=[xs(2.4->#rem)]
          color=[xs(Colors.gray)]>
          {post.body->s}
        </Typography>
      </>
    | Error(error) => React.string(error.message)
    | Fetching => React.string("Fetching...")
    | _ => React.null
    }}
  </div>
}
