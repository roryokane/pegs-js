# Pegs

The game Pegs for the TI-83+ graphing calculator, ported to the browser. I’m still working on this port, but you can [play what I have so far](https://roryokane.github.io/pegs-js/) on GitHub.

[The original Pegs](http://www.detachedsolutions.com/puzzpack/pegs.php) was part of PuzzPack by Detached Solutions, and its main developer was Fred Coughlin. This port is by [Rory O’Kane](http://roryokane.com/).

I already wrote a complete port of pegs to Adobe Flash in 2006, but it is no longer published anywhere (it was on GeoCities). Now I’m porting that port to HTML, CSS, and JavaScript. I already have all image assets the game needs (which I reproduced by hand, pixel-by-pixel), and ActionScript 2 code that reproduces all behavior of the original game. However, the old code needs refactoring – it uses too many comments and not enough constants and functions.

## Building

Building this project requires [NPM](https://www.npmjs.com/).

* Run `make serve` to start a development server that automatically compiles files
* Run `make build` to generate a `dist` folder containing the compiled site

## Testing

Run `make test` to run the tests.
