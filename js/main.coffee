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
	
	screens.title.buttonsInOrder = [menuButtons.play, menuButtons.help, menuButtons.exit]
	
	
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
	
	# display functions. These do not run events, only change the visuals.
	showScreen = (screen) ->
		hideAllButOne(screens.allSelector, screen.element)
	showMenuButton = (menuButton) ->
		hideAllButOne(menuButtons.allSelector, menuButton.element)
	showMessage = (message) ->
		hideAllButOne(messages.allSelector, message.element)
	hideMessages = () ->
		selectInGame(messages.allSelector).hide()
	
	
	# game state
	
	currentScreen = screens.title
	
	
	# more functions
	
	changeScreen = (screen) ->
		currentScreen.exitHandler?()
		
		showScreen(screen)
		currentScreen = screen
		
		currentScreen.enterHandler?()
	
	changeMenuButton = (button) ->
		showMenuButton(button)
		screens.title.selectedButton = button
	
	# initialize handlers as blank
	_(screens).each (screen) ->
		screen.inputHandlers = {}
		screen.enterHandler = ->
		screen.exitHandler = ->
	
	addTitleScreenHandlers = (title) ->
		moveButtonSelection = (direction) ->
			numButtons = currentScreen.buttonsInOrder.length
			currentButtonIndex = _(currentScreen.buttonsInOrder).indexOf(currentScreen.selectedButton)
			newIndex = (currentButtonIndex + direction) % numButtons
			currentScreen.selectedButton = currentScreen.buttonsInOrder[newIndex]
		
		title.inputHandlers.left = ->
			moveButtonSelection(-1)
		title.inputHandlers.right = ->
			moveButtonSelection(1)
		title.inputHandlers.confirm = ->
			return
		title.inputHandlers.exit = ->
			return
		title.enterHandler = ->
			title.selectedButton = menuButtons.play
			showMenuButton(menuButtons.play)
	addTitleScreenHandlers(screens.title)
	
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
	# will need to convert the above strings in to numeric key codes
	
	registeredInputHandlers = {}
	
	$(window).on 'keypress', (event) ->
		whichKey = event.which
		console.log("noticed keypress of", whichKey)
		if whichKey in registeredInputHandlers
			$(event).preventDefault()
			console.log("caught keypress of", whichKey, "and running", registeredInputHandlers[whichKey])
			registeredInputHandlers[whichKey]()
	
	registerKey = (control, handler) ->
		registeredInputHandlers[control] = handler
	
	_(keys).each (controls, eventName) ->
		_(controls).each (control) ->
			runInputHandlerIfExists = () ->
				console.log("about to try running event", eventName, "from", currentScreen.inputHandlers)
				currentScreen.inputHandlers?[eventName]?()
			registerKey control, runInputHandlerIfExists
	console.log(registeredInputHandlers)
	
	
	# start the game
	
	changeScreen(currentScreen)
