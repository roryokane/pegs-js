jQuery ($) ->
	# game data
	
	tiles =
		blank: {filename: "blank.gif", alt: "blank", char: " "}
		circle: {filename: "circle.gif", alt: "circle", char: "o"}
		cross: {filename: "cross.gif", alt: "cross", char: "+"}
		hole: {filename: "hole.gif", alt: "hole", char: "#"}
		player: {filename: "player.gif", alt: "player", char: "P"}
		solidBlock: {filename: "solid-block.gif", alt: "solid block", char: "X"}
		square: {filename: "square.gif", alt: "square", char: "s"}
		triangle: {filename: "triangle.gif", alt: "triangle", char: "^"}
	screens =
		allSelector: '.screen'
		title: {selector: ".title-screen"}
		help: {selector: ".help-screen"}
		level: {selector: ".level-screen"}
		finished: {selector: ".finished-screen"}
	menuButtons =
		allSelector: '.menu-button'
		play: {selector: ".play-button"}
		help: {selector: ".help-button"}
		exit: {selector: ".exit-button"}
	messages =
		allSelector: '.message'
		title: {selector: ".dont-match-message"}
		help: {selector: ".you-fell-message"}
		level: {selector: ".beat-level-message"}
	
	
	# some functions
	
	$game = $('.pegs-game')
	selectInGame = (selector) ->
		return $game.find(selector)
	
	cacheElementAsProperty = (item) ->
		item.element = selectInGame(item.selector)
	_([screens, messages, menuButtons]).each (collection) ->
		_(collection).each cacheElementAsProperty
	
	hideAllButOne = (scopeSelector, oneToShow) ->
		selectInGame(scopeSelector).hide()
		oneToShow.show()
	
	showScreen = (screen) ->
		hideAllButOne(screens.allSelector, screen.element)
	showMenuButton = (menuButton) ->
		hideAllButOne(menuButtons.allSelector, menuButton.element)
	showMessage = (message) ->
		hideAllButOne(messages.allSelector, message.element)
	hideMessages = () ->
		selectInGame(messages.allSelector).hide()
	
	# attach input handlers
	
	
	# game state
	
	currentScreen = screens.title
	screens.title.selected = menuButtons.play
	
	
	# more functions
	
	changeScreen = (screen) ->
		currentScreen.exitHandler?()
		
		showScreen(screen)
		currentScreen = screen
		
		currentScreen.enterHandler?()
	
	_(screens).each (screen) ->
		screen.inputHandlers = {}
		screen.enterHandler = ->
		screen.exitHandler = ->
	
	addTitleHandlers = (title) ->
		screens.title.inputHandlers.left = ->
			return
		screens.title.inputHandlers.right = ->
			return
		screens.title.inputHandlers.confirm = ->
			return
		screens.title.inputHandlers.exit = ->
			return
		screens.title.enterHandler = ->
			showMenuButton(menuButtons.play)
	addTitleHandlers(screens.title)
	
	# register input handlers
	keys =
		up: ['up']
		down: ['down']
		left: ['left']
		right: ['right']
		confirm: ['enter', 'space']
		exit: ['esc']
		nextLevel: ['+']
		previousLevel: ['-']
	
	registerKey = (control, handler) ->
		return
	_(keys).each (controls, eventName) ->
		_(controls).each (control) ->
			registerKey control, () ->
				currentScreen.inputHandlers?[eventName]?()
	
	
	# start the game
	
	changeScreen(currentScreen)
