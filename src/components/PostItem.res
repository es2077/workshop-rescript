open AncestorSpacy
open Theme
open Render

let card = Emotion.css({
  "transition": "300ms",
  "cursor": "pointer",
  "&:hover": {
    "transform": "translateY(-3px)",
  },
})

@react.component
let make = (~title, ~body, ~slug, ~authorName, ~claps, ~date) => {
  <Next.Link href={`/post/${slug}`}>
    <Box my=[xs(4)] className=card>
      <Typography
        tag=#h1
        m=[xs(0)]
        mb=[xs(2)]
        fontSize=[xs(2.4->#rem)]
        letterSpacing=[xs(-0.02->#rem)]
        color=[xs(Colors.black)]>
        {title->s}
      </Typography>
      <Typography
        tag=#p
        m=[xs(0)]
        mb=[xs(2)]
        fontSize=[xs(1.8->#rem)]
        lineHeight=[xs(2.4->#rem)]
        color=[xs(Colors.gray)]>
        {body->s}
      </Typography>
      <Box mt=[xs(4)]>
        <Box display=[xs(#none), sm(#flex)]>
          <PostInformation variant=Author> {authorName->s} </PostInformation>
          <PostInformation variant=Claps> {claps->React.int} </PostInformation>
          <PostInformation variant=Date> {date->s} </PostInformation>
        </Box>
      </Box>
      <Divider mt=[xs(4)] />
    </Box>
  </Next.Link>
}
