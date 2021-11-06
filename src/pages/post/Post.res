open ReScriptUrql

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
  let ({Hooks.response: response}, executeQuery) = Hooks.useQuery(
    ~query=module(PostQuery),
    {id: a.query["slug"]},
  )

  <div>
    {switch response {
    | Data({node: Some(#post(post))}) =>
      <div> <h1> {post.title->React.string} </h1> <p> {post.body->React.string} </p> </div>
    | Error(_) => <div> <h1> {"Error"->React.string} </h1> </div>
    | _ => React.null
    }}
  </div>
}
