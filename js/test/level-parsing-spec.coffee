expect = require('chai').expect

levelParsing = require('../level-parsing')
{parseLevel, TileTypes} = levelParsing

describe "parseLevel", ->
	it "can parse a simple level", ->
		input = ["P X ", "o   "]
		expected = [
			[TileTypes.Player, TileTypes.SolidBlock]
			[TileTypes.Circle, TileTypes.Blank]
		]
		expect( parseLevel(input) ).to.eql(expected)
