var pickFiles = require('broccoli-static-compiler');
var fastBrowserify = require('broccoli-fast-browserify');
var coffeeify = require('coffeeify')
var compileSass = require('broccoli-sass');
var mergeTrees = require('broccoli-merge-trees');

function wrapTreeContentsInDirectory(tree, directoryName) {
	return pickFiles(tree, {srcDir: '/', destDir: directoryName});
}


var appJsTree = 'js';
var appJsFile = fastBrowserify(appJsTree, {
  bundles: {
    "js/combined-js.js": {
      entryPoints: ['main.*'],
      transform: coffeeify,
    }
  },
	browserify: {
		extensions: [".coffee"],
		debug: true,
	},
});

var vendoredJsTree = 'js/vendor';
vendoredJsTree = wrapTreeContentsInDirectory(vendoredJsTree, 'js/vendor');

var stylesTree = 'style';
stylesTree = compileSass([stylesTree], 'style.sass', 'style/style.css');

var publicFilesTree = 'public';

module.exports = mergeTrees([appJsFile, vendoredJsTree, stylesTree, publicFilesTree]);
