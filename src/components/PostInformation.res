open AncestorSpacy
open Render

type variant = Author | ReadingTime | Date | Claps | Comments

@react.component
let make = (~variant: variant, ~children) => {
  <Box display=[xs(#flex)] alignItems=[xs(#center)] mr=[xs(4)]>
    <Typography fontSize=[xs(2.4->#rem)] tag=#span mr=[xs(2)]>
      {switch variant {
      | Author => `👤`
      | Claps => `👏`
      | Date => `📅`
      | ReadingTime => `🕒`
      | Comments => `💬`
      }->s}
    </Typography>
    <Typography
      tag=#span
      fontWeight=[xs(#700)]
      color=[xs(Theme.Colors.black)]
      fontSize=[xs(1.6->#rem)]
      letterSpacing=[xs(-0.03->#em)]>
      {children}
    </Typography>
  </Box>
}
