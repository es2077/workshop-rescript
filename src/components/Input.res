module Styles = {
  open Theme

  let input = Emotion.css({
    "border": `solid 1.5px ${Colors.grayLight->Colors.toString}`,
    "borderRadius": "6px",
    "backgroundColor": "#fafafa",
    "width": "100%",
    "padding": "1.6rem 1.6rem",
    "fontSize": "1.8rem",
    "letterSpacing": "-0.03em",
    "resize": "vertical",
    "outline": "none",
    "transition": "200ms",
    "&:focus": {
      "borderColor": Colors.black->Colors.toString,
    },
    "&:placeholder": {
      "color": Colors.gray->Colors.toString,
    },
  })
}

@react.component
let make = (~onChange=?, ~value=?, ~placeholder=?, ~type_=?) => {
  <input className=Styles.input ?value ?onChange ?placeholder ?type_ />
}

module Textarea = {
  @react.component
  let make = (~onChange=?, ~value=?, ~placeholder=?) => {
    <textarea rows=12 className=Styles.input ?value ?onChange ?placeholder />
  }
}
