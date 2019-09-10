_ = require('lodash')

exports.TileTypes = TileTypes =
	Object.freeze
		Player: 1
		Blank: 2
		SolidBlock: 3
		Hole: 4
		Circle: 5
		Cross: 6
		Square: 7
		Triangle: 8

# TODO fill in all chars
# I will probably do that by moving some or all of the data in the currently-unused `tiles` variable in `main.coffee`
tileChars =
	'P': TileTypes.Player
	'X': TileTypes.SolidBlock
	'o': TileTypes.Circle
	' ': TileTypes.Blank

exports.parseLevel = (levelStrings) ->
	# convert level strings like
	# ["P X ", "o   "]
	# into
	# [[TileTypes.Player, TileTypes.SolidBlock], [TileTypes.Circle, TileTypes.Blank]]
	_.map levelStrings, (rowString, index) ->
		rowStringChars = rowString.split('')
		rowChars = _.reject rowStringChars, (char, index) ->
			# ignore even characters (odd indexes), which are spaces
			index %	2 == 1
		_.map rowChars, (char) ->
			tileChars[char]
