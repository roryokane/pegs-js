jQuery ($) ->
	# game data
	
	tiles =
		blank: {filename: "blank.gif", alt: "blank", chars: [" ", ".", "·"]}
		circle: {filename: "circle.gif", alt: "circle", chars: ["o", "○"]}
		cross: {filename: "cross.gif", alt: "cross", chars: ["+", "✚"]}
		hole: {filename: "hole.gif", alt: "hole", chars: ["#", "■"]}
		player: {filename: "player.gif", alt: "player", chars: ["P", "✠"]}
		solidBlock: {filename: "solid-block.gif", alt: "solid block", chars: ["X", "⛝"]}
		square: {filename: "square.gif", alt: "square", chars: ["s", "□"]}
		triangle: {filename: "triangle.gif", alt: "triangle", chars: ["<", "◺"]}
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
	
	levels = [
		[
			['X','X','X','X','X','X','X','X','X','X','X','X']
			['X',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','X']
			['X',' ',' ',' ','✠',' ',' ','○',' ',' ',' ','X']
			['X',' ',' ',' ',' ','+','+','◺',' ',' ',' ','X']
			['X',' ',' ',' ','□','■',' ','○',' ',' ',' ','X']
			['X',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','X']
			['X',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','X']
			['X','X','X','X','X','X','X','X','X','X','X','X']
			[2, 4] # TODO auto-detect player location
		]
	]
	
	displayData =
		nativeResolution:
			width: 96
			height: 64
		scaleFactor: 2
	
	screens.title.buttonsInOrder = [menuButtons.play, menuButtons.help, menuButtons.exit]
	screens.help.cropSelector = screens.help.selector + ' ' + '.crop-area'
	screens.help.drawData =
		startY: 8 # in native resolution pixels
		stepY: 7
		endY: 64
		secsBetweenDraws: 0.05
	
	
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
	
	nativePixelsToDisplayPixels = (nativePixels) ->
		nativePixels * displayData.scaleFactor
	
	
	# game state
	
	currentScreen = undefined
	
	
	# more functions
	
	changeScreen = (screen) ->
		currentScreen?.exitHandler?()
		
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
	
	constrainToRange = (value, min, max) ->
		return switch
			when value < min then min
			when value > max then max
			else value
	
	addTitleScreenHandlers = (title) ->
		moveButtonSelection = (direction) ->
			numButtons = currentScreen.buttonsInOrder.length
			currentIndex = _(currentScreen.buttonsInOrder).indexOf(currentScreen.selectedButton)
			newIndex = constrainToRange(currentIndex + direction, 0, (numButtons - 1))
			changeMenuButton(currentScreen.buttonsInOrder[newIndex])
		
		title.inputHandlers.left = ->
			moveButtonSelection(-1)
		title.inputHandlers.right = ->
			moveButtonSelection(1)
		title.inputHandlers.confirm = ->
			switch currentScreen.selectedButton
				when menuButtons.play
					changeScreen(screens.level)
				when menuButtons.help
					changeScreen(screens.help)
				when menuButtons.exit
					return
		title.inputHandlers.exit = ->
			return
		title.enterHandler = ->
			title.selectedButton = menuButtons.play
			showMenuButton(menuButtons.play)
	addTitleScreenHandlers(screens.title)
	
	addHelpScreenHandlers = (help) ->
		returnToMenuOnInput = ->
			if ! currentScreen.drawing
				changeScreen(screens.title)
		
		setCropHeight = (heightInNativePixels) ->
			actualHeight = nativePixelsToDisplayPixels(heightInNativePixels)
			cropArea = $(help.cropSelector)
			cropArea.height(actualHeight)
		
		initializeDrawing = ->
			currentScreen.drawing = true
			currentScreen.currentCropY = help.drawData.startY
			setCropHeight(currentScreen.currentCropY)
			setTimeout drawNextLine, currentScreen.drawData.secsBetweenDraws*1000
		
		drawNextLine = ->
			currentScreen.currentCropY += help.drawData.stepY
			setCropHeight(currentScreen.currentCropY)
			
			finished = currentScreen.currentCropY >= help.drawData.endY
			if finished
				currentScreen.drawing = false
			else
				setTimeout drawNextLine, currentScreen.drawData.secsBetweenDraws*1000
		
		help.inputHandlers.confirm = ->
			returnToMenuOnInput()
		help.inputHandlers.exit = ->
			returnToMenuOnInput()
		help.enterHandler = ->
			initializeDrawing()
	addHelpScreenHandlers(screens.help)
	
	addLevelScreenHandlers = (level) ->
		inputHandlers = {normal: {}, messageShowing: {}}
		
		level.inputHandlers.confirm = ->
			return
		level.inputHandlers.exit = ->
			changeScreen(screens.title)
		level.enterHandler = ->
			return
		level.exitHandler = ->
			# save the current level, if the player hasn’t moved on it yet
			# does it save the level if the player returns to the
			#  title screen, as opposed to refreshing the page?
			return
	addLevelScreenHandlers(screens.level)
	
	# register input handlers
	
	keys =
		up: ['up']
		down: ['down']
		left: ['left']
		right: ['right']
		confirm: ['enter', 'space']
		reset: ['r']
		exit: ['esc']
		nextLevel: ['plus']
		previousLevel: ['minus']
	
	registerKey = (control, handler) ->
		keymage(control, handler, {preventDefault: true})
	
	_(keys).each (controls, eventName) ->
		_(controls).each (control) ->
			runInputHandlerIfExists = (event) ->
				currentScreen.inputHandlers?[eventName]?(event)
			registerKey control, runInputHandlerIfExists
	
	
	# start the game
	
	changeScreen(screens.title)
