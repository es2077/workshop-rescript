open AncestorSpacy
open Render
open ReScriptUrql

module FormState = %lenses(
  type state = {
    authorName: string,
    title: string,
    body: string,
  }
)

module PostForm = ReForm.Make(FormState)

module InsertPostOneMutation = %graphql(`
  mutation InsertPostOneMutation($input: post_insert_input!) {
    insert_post_one(object: $input) {
      id
      title
      body
    }
  }
`)

@react.component
let make = () => {
  let router = Next.Router.useRouter()
  let (_, executeInsertPost) = Hooks.useMutation(~mutation=module(InsertPostOneMutation))

  let form: PostForm.api = PostForm.use(
    ~validationStrategy=OnChange,
    ~onSubmit={
      ({state}: PostForm.onSubmitAPI) => {
        Js.log(state)

        executeInsertPost({
          input: {
            key: None,
            claps: None,
            comments: None,
            created_at: Some(Js.Date.make()->Js.Date.toISOString),
            title: Some(state.values.title),
            author: Some(state.values.authorName),
            body: Some(state.values.body),
          },
        })
        ->Promise.then(_result => {
          router->Next.Router.push(`/`)

          Promise.resolve()
        })
        ->ignore

        None
      }
    },
    ~initialState={
      authorName: "",
      title: "",
      body: "",
    },
    ~schema={
      open! PostForm.Validation

      Schema(nonEmpty(AuthorName) + nonEmpty(Body) + nonEmpty(Title))
    },
    (),
  )

  Js.log(form.state.values)

  <Box>
    <Box mb=[xs(4)]>
      <Typography
        tag=#h1
        m=[xs(0)]
        mb=[xs(2)]
        fontSize=[xs(2.4->#rem)]
        letterSpacing=[xs(-0.02->#rem)]
        color=[xs(Theme.Colors.black)]>
        {`New post`->s}
      </Typography>
    </Box>
    <Box mb=[xs(2)]>
      <Input
        onChange={e => {
          let value = (e->ReactEvent.Form.target)["value"]

          form.handleChange(AuthorName, value)
        }}
        placeholder="Your name"
      />
    </Box>
    <Box mb=[xs(2)]>
      <Input
        onChange={e => {
          let value = (e->ReactEvent.Form.target)["value"]

          form.handleChange(Title, value)
        }}
        placeholder="Post title"
      />
    </Box>
    <Box mb=[xs(4)]>
      <Input.Textarea
        onChange={e => {
          let value = (e->ReactEvent.Form.target)["value"]

          form.handleChange(Body, value)
        }}
        placeholder="Description"
      />
    </Box>
    {switch form.formState {
    | Submitting => React.string("Submitting...")
    | Errored => React.string("Errored")
    | _ => React.null
    }}
    <Box display=[xs(#flex)] justifyContent=[xs(#"flex-end")]>
      <Button
        onClick={_ => {
          form.submit()
        }}>
        "Create new post"
      </Button>
    </Box>
  </Box>
}
