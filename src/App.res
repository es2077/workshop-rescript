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
  },
  "*": {
    "boxSizing": "border-box",
  },
})

let default = (props): React.element => {
  let {component, pageProps} = props
  let children = React.createElement(component, pageProps)

  children
}
