open Render

module Styles = {
  open Theme

  let button = Emotion.css({
    "borderRadius": "6px",
    "border": "0",
    "padding": "0 1.6rem",
    "height": "4.2rem",
    "minWidth": "16.0rem",
    "background": Colors.black->Colors.toString,
    "color": Colors.white->Colors.toString,
    "fontSize": "1.8rem",
    "letterSpacing": "-0.03em",
    "cursor": "pointer",
    "transition": "400ms",
    "&:hover": {
      "transform": "translateY(-4px)",
      "boxShadow": "0px 5px 18px rgba(25, 25, 25, 0.23)",
    },
  })
}

@react.component
let make = (~onClick=?, ~children) => {
  <button ?onClick className=Styles.button> {children->s} </button>
}
