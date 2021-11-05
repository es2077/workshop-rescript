const bsconfig = require("./bsconfig.json");

const transpileModules = ["rescript"].concat(bsconfig["bs-dependencies"]);

const withBundleAnalyzer = require("@next/bundle-analyzer")({
  enabled: process.env.ANALYZE === "true",
});

const config = {
  pageExtensions: ["jsx", "js"],
  transpileModules,
  env: {
    ENV: process.env.NODE_ENV,
  },
};

module.exports = withBundleAnalyzer(config);
