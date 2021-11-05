open Theme
open AncestorSpacy
open Render

%raw(`require('normalize.css')`)

type pageProps

type props = {
  @as("Component")
  component: React.component<pageProps>,
  pageProps: pageProps,
}

Emotion.injectGlobal({
  "html": {
    "fontSize": "10px",
  },
  "html, body": {
    "width": "100%",
    "height": "100%",
    "background": Colors.white->Colors.toString,
    "fontFamily": "DM Sans",
  },
  "*": {
    "boxSizing": "border-box",
  },
})

let default = (props): React.element => {
  let {component, pageProps} = props
  let children = React.createElement(component, pageProps)

  <Box px=[xs(3)] display=[xs(#flex)] flexDirection=[xs(#column)] alignItems=[xs(#center)]>
    <Header />
    <Box
      flexGrow=[xs(#num(4.0))]
      maxW=[xs(77.4->#rem)]
      width=[xs(100.0->#pct)]
      height=[xs(100.0->#pct)]>
      children
    </Box>
    <Box mt=[xs(10)] pb=[xs(2)]>
      <Typography
        m=[xs(0)]
        mb=[xs(2)]
        fontWeight=[xs(#700)]
        fontSize=[xs(1.8->#rem)]
        letterSpacing=[xs(-0.02->#rem)]
        color=[xs(Colors.black)]>
        {`Made with ReScript, Next and GraphQL 🚀 `->s}
      </Typography>
    </Box>
  </Box>
}
