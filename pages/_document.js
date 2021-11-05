import React from "react";
import createEmotionServer from "@emotion/server/create-instance";
import Document, { Html, Head, Main, NextScript } from "next/document";
import { cache } from "@emotion/css";

class AppDocument extends Document {
  static async getInitialProps(ctx) {
    const page = ctx.renderPage();
    const initialProps = await Document.getInitialProps(ctx);
    const { css, ids } = await renderStatic(page.html);

    return {
      ...initialProps,
      styles: (
        <>
          {initialProps.styles}
          <style
            data-emotion={`css ${ids.join(" ")}`}
            dangerouslySetInnerHTML={{ __html: css }}
          />
        </>
      ),
    };
  }

  render() {
    return (
      <Html lang="pt-br">
        <Head>
          <link rel="preconnect" href="https://fonts.googleapis.com" />
          <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
          <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet" />
        </Head>
        <body>
          <Main />
          <NextScript />
        </body>
      </Html>
    );
  }
}

export const renderStatic = async (html) => {
  if (html === undefined) {
    throw new Error("did you forget to return html from renderToString?");
  }
  const { extractCritical } = createEmotionServer(cache);
  const { ids, css } = extractCritical(html);

  return { html, ids, css };
};

export default AppDocument;
