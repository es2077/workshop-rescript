open AncestorSpacy
open Render
open Theme

let link = Emotion.css({"textDecoration": "none"})

@react.component
let make = () => {
  <Box
    py=[xs(8)]
    width=[xs(100.0->#pct)]
    display=[xs(#flex)]
    alignItems=[xs(#center)]
    justifyContent=[xs(#"space-between")]
    maxW=[xs(97.0->#rem)]>
    <Next.Link href="/"> <a> <img src="/logo.svg" /> </a> </Next.Link>
    <Base
      display=[xs(#flex)]
      alignItems=[xs(#center)]
      className=link
      tag=#a
      href="https://es77.dev"
      target="_blank">
      <Typography fontSize=[xs(2.4->#rem)] mr=[xs(1)] tag=#span> {`🔗`->s} </Typography>
      <Typography
        color=[xs(Colors.black)]
        fontWeight=[xs(#bold)]
        letterSpacing=[xs(-0.03->#em)]
        fontSize=[xs(1.8->#rem)]>
        {`es77.dev`->s}
      </Typography>
    </Base>
  </Box>
}
