open AncestorSpacy

@react.component
let make = (~m=?, ~mt=?, ~mb=?) => {
  <Box
    ?m ?mt ?mb height=[xs(1->#px)] bgColor=[xs(Theme.Colors.grayLight)] width=[xs(100.0->#pct)]
  />
}
