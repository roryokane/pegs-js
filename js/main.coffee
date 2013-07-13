jQuery ($) ->
	tiles =
		blank: {filename: "blank.gif", alt: "blank", char: " "}
		circle: {filename: "circle.gif", alt: "circle", char: "o"}
		cross: {filename: "cross.gif", alt: "cross", char: "+"}
		hole: {filename: "hole.gif", alt: "hole", char: "#"}
		player: {filename: "player.gif", alt: "player", char: "P"}
		solid_block: {filename: "solid-block.gif", alt: "solid block", char: "X"}
		square: {filename: "square.gif", alt: "square", char: "s"}
		triangle: {filename: "triangle.gif", alt: "triangle", char: "^"}
	screens =
		title: {selector: ".title-screen"}
		help: {selector: ".help-screen"}
		level: {selector: ".level-screen"}
		finished: {selector: ".finished-screen"}
	
	currentScreen = screens.title
	$game = $('.pegs-game')
	
	hideAllButOne = (scopeSelector, showSelector) ->
		$game.find(scopeSelector).hide()
		$game.find(showSelector).show()
	
	showScreen = (screen) ->
		hideAllButOne('.screen', screen.selector)
	
	showScreen(currentScreen)
