open AncestorSpacy
open Render

@react.component
let make = () => {
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
    <Box mb=[xs(2)]> <Input placeholder="Your name" /> </Box>
    <Box mb=[xs(2)]> <Input placeholder="Post title" /> </Box>
    <Box mb=[xs(4)]> <Input.Textarea placeholder="Description" /> </Box>
    <Box display=[xs(#flex)] justifyContent=[xs(#"flex-end")]>
      <Button> "Create new post" </Button>
    </Box>
  </Box>
}
