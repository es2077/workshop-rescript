open AncestorSpacy
open Render

type icon = Author | Clap | Date | Comment | ReadingTime

@react.component
let make = (~icon: icon, ~children) => {
  <Box display=[xs(#flex)] alignItems=[xs(#center)] mr=[xs(4)]>
    <Typography tag=#span mr=[xs(2)] fontSize=[xs(#rem(2.4))]>
      {switch icon {
      | Author => `👤`
      | Clap => `👏`
      | Date => `📅`
      | Comment => `💬`
      | ReadingTime => `⏰`
      }->s}
    </Typography>
    <Typography
      m=[xs(0)]
      letterSpacing=[xs(#em(-0.03))]
      tag=#p
      color=[xs(Theme.Colors.black)]
      fontSize=[xs(#rem(1.6))]
      fontWeight=[xs(#700)]>
      {children->s}
    </Typography>
  </Box>
}
