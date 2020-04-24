const CopyWebpackPlugin = require("copy-webpack-plugin");
const path = require('path');

module.exports = {
	entry: './bootstrap.js',
	output: {
    path: path.resolve(__dirname, "dist"),
    filename: "app.js",
  },  
	module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
				use: {
        	loader: 'elm-webpack-loader',
        	options: {}
      	}
      }
    ]
  },
  devServer: {
    contentBase: path.join(__dirname, 'dist'),
    compress: true,
    stats: 'errors-only'
  },
  plugins: [
    new CopyWebpackPlugin(['index.html'])
  ],
};
