open AncestorSpacy

@react.component
let make = () => {
  <Box mt=[xs(7)]>
    <Box display=[xs(#flex)] justifyContent=[xs(#"flex-end")]>
      //
      <Next.Link href="/new-post"> <Button> "New post" </Button> </Next.Link>
    </Box>
    <Box mt=[xs(4)]>
      <PostItem
        title=`My tweet blew up, what should I do?`
        body=`I recently started using HypeFury to post tweets regularly. The idea is to build my audience (of Indie Hackers and creators) and hopef...`
        slug=`my-tweet`
        authorName=`Marcos`
        claps=200
        date=`May 21, 2021`
      />
      <PostItem
        title=`My tweet blew up, what should I do?`
        body=`I recently started using HypeFury to post tweets regularly. The idea is to build my audience (of Indie Hackers and creators) and hopef...`
        slug=`my-tweet`
        authorName=`Marcos`
        claps=200
        date=`May 21, 2021`
      />
      <PostItem
        title=`My tweet blew up, what should I do?`
        body=`I recently started using HypeFury to post tweets regularly. The idea is to build my audience (of Indie Hackers and creators) and hopef...`
        slug=`my-tweet`
        authorName=`Marcos`
        claps=200
        date=`May 21, 2021`
      />
    </Box>
  </Box>
}
