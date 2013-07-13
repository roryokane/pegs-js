// This code was written by Rory O'Kane

level = 1;
loadLevel(level);

function loadLevel(level) {
	if (level == 1) {
		var leveldata = [[2,2,2,2,2,2,2,2,2,2,2,2],
						 [2,1,1,1,1,1,1,1,1,1,1,2],
						 [2,1,1,1,4,1,1,5,1,1,1,2],
						 [2,1,1,1,1,8,8,6,1,1,1,2],
						 [2,1,1,1,7,3,1,5,1,1,1,2],
						 [2,1,1,1,1,1,1,1,1,1,1,2],
						 [2,1,1,1,1,1,1,1,1,1,1,2],
						 [2,2,2,2,2,2,2,2,2,2,2,2],
						 [2, 4]];
	} else if (level == 2) {
		var leveldata = [[2,2,2,2,2,2,2,2,2,2,2,2],
						 [2,2,2,1,1,1,6,6,1,1,1,2],
						 [2,2,2,1,1,1,2,1,1,1,1,2],
						 [2,2,2,1,1,1,2,2,1,1,1,2],
						 [4,1,1,1,6,6,5,5,1,1,1,2],
						 [2,2,2,1,1,1,2,2,1,1,1,2],
						 [2,2,2,1,1,1,2,1,1,1,1,2],
						 [2,2,2,1,1,1,6,6,1,1,1,2],
						 [4, 0]];
	} else if (level == 3) {
		var leveldata = [[2,2,2,2,2,2,2,2,2,2,2,2],
						 [2,2,2,2,2,2,2,2,2,2,2,2],
						 [2,1,1,1,1,1,6,1,4,1,1,1],
						 [2,1,2,2,1,2,2,1,2,2,6,2],
						 [2,1,1,6,1,1,1,1,1,1,1,2],
						 [2,2,2,2,2,2,2,2,2,2,6,2],
						 [2,2,2,2,2,2,2,2,2,2,2,2],
						 [2,2,2,2,2,2,2,2,2,2,2,2],
						 [2, 8]];
	} else if (level == 4) {
		var leveldata = [[2,2,2,2,2,2,2,2,2,2,2,2],
						 [3,1,7,1,6,1,6,1,1,1,1,2],
						 [3,1,8,1,5,1,6,1,1,1,1,2],
						 [3,1,5,1,7,4,6,1,1,1,1,2],
						 [3,1,6,1,7,1,6,1,8,1,1,2],
						 [3,1,7,1,5,1,6,1,1,1,1,2],
						 [3,1,5,1,7,1,6,1,1,1,1,2],
						 [2,2,2,2,2,2,2,2,2,2,2,2],
						 [3, 5]];
	} else if (level == 5) {
		var leveldata = [[1,3,3,1,7,3,1,1,3,1,1,1],
						 [1,3,3,1,7,7,1,1,3,1,1,6],
						 [6,3,3,1,3,3,3,1,2,6,6,6],
						 [1,3,3,1,3,7,3,1,2,6,1,6],
						 [1,3,3,1,3,4,3,5,3,1,1,1],
						 [6,3,3,1,3,3,3,1,3,1,1,1],
						 [1,3,3,1,7,1,1,1,3,1,1,1],
						 [1,3,3,1,1,5,1,1,3,5,5,1],
						 [4, 5]];
	} else if (level == 6) {
		var leveldata = [[4,1,1,1,1,1,1,1,1,1,1,1],
						 [6,1,1,1,1,1,1,1,1,1,8,1],
						 [6,1,1,6,1,1,1,6,6,1,1,1],
						 [1,2,2,6,2,2,2,2,2,2,2,1],
						 [1,1,1,1,1,1,1,1,1,1,1,1],
						 [1,2,2,2,2,1,2,2,1,2,2,2],
						 [1,8,1,1,1,1,1,1,5,7,3,1],
						 [1,1,1,2,2,2,2,1,1,2,2,2],
						 [0, 0]];
	} else if (level == 7) {
		var leveldata = [[2,2,2,2,1,1,2,2,2,2,2,2],
						 [2,2,2,3,1,1,7,3,1,2,2,2],
						 [2,2,2,2,1,2,5,2,1,2,2,2],
						 [2,2,2,6,8,8,4,7,6,3,2,2],
						 [2,2,2,2,1,2,6,2,1,1,1,2],
						 [2,2,2,2,1,1,5,1,1,2,1,2],
						 [2,2,2,2,2,2,2,1,2,2,1,2],
						 [2,2,2,2,2,2,2,1,1,1,1,2],
						 [3, 6]];
	} else if (level == 8) {
		var leveldata = [[2,2,2,2,2,2,2,2,2,2,2,2],
						 [1,1,8,8,8,8,8,7,8,8,1,1],
						 [1,1,8,8,8,6,8,8,5,8,1,1],
						 [4,1,8,8,8,6,8,8,7,8,1,1],
						 [1,1,8,8,7,5,8,8,8,8,1,1],
						 [1,1,8,8,5,6,8,8,8,8,1,1],
						 [1,1,8,8,6,7,8,8,8,8,1,1],
						 [2,2,2,2,2,2,2,2,2,2,2,2],
						 [3, 0]];
	} else if (level == 9) {
		var leveldata = [[1,1,1,1,2,2,1,1,1,1,1,1],
						 [1,8,1,1,2,2,1,1,1,1,1,1],
						 [1,1,1,1,6,7,7,8,1,2,2,1],
						 [1,2,1,1,6,2,1,1,1,2,2,2],
						 [1,1,1,6,6,4,2,1,1,1,1,6],
						 [1,1,1,1,6,2,1,1,2,2,2,2],
						 [1,8,2,1,6,5,5,1,1,1,8,1],
						 [1,1,1,1,7,2,1,1,1,1,1,1],
						 [4, 5]];
	} else if (level == 10) {
		var leveldata = [[2,2,2,2,6,2,2,2,1,1,1,1],
						 [2,2,2,2,1,2,2,2,1,1,1,4],
						 [1,1,7,1,3,3,3,1,1,1,8,1],
						 [1,8,8,1,3,3,3,1,7,8,7,1],
						 [1,8,8,1,3,3,3,1,7,8,7,1],
						 [1,1,1,1,3,3,3,1,8,1,1,1],
						 [2,2,2,2,2,1,2,2,1,1,1,1],
						 [2,2,2,2,2,6,2,2,1,1,1,1],
						 [1, 11]];
	} else if (level == 11) {
		var leveldata = [[2,4,2,1,2,2,3,1,1,2,2,2],
						 [2,1,1,1,5,7,3,3,1,6,6,1],
						 [2,6,2,6,1,2,3,1,1,6,6,1],
						 [2,1,1,6,1,2,1,1,1,8,8,1],
						 [2,6,2,1,1,2,1,2,1,8,8,1],
						 [1,1,1,1,1,2,1,2,2,1,2,1],
						 [1,8,7,8,1,2,1,2,1,1,1,1],
						 [1,1,1,1,6,6,6,2,2,2,2,2],
						 [0, 1]];
	} else if (level == 12) {
		var leveldata = [[4,1,1,1,1,1,2,2,2,2,2,2],
						 [2,6,2,6,2,6,2,2,1,1,1,2],
						 [1,1,1,1,1,1,2,1,1,2,1,2],
						 [2,6,2,6,2,6,2,1,1,1,1,2],
						 [1,1,1,1,1,1,2,2,5,5,3,2],
						 [2,6,2,6,2,6,2,2,1,6,6,2],
						 [1,1,1,1,1,1,1,1,1,1,6,2],
						 [2,1,2,2,2,2,2,2,1,1,2,2],
						 [0, 0]];
	} else if (level == 13) {
		var leveldata = [[2,2,2,2,2,2,2,2,2,2,2,2],
						 [1,1,7,1,6,1,5,1,7,1,1,3],
						 [1,1,6,1,5,1,6,1,7,1,1,3],
						 [4,1,8,1,7,1,5,1,7,1,1,3],
						 [1,1,5,1,7,1,6,1,7,1,1,3],
						 [1,1,7,1,6,1,5,1,7,1,1,3],
						 [1,1,8,1,8,1,6,1,7,1,1,3],
						 [2,2,2,2,2,2,2,2,2,2,2,2],
						 [3, 0]];
	} else if (level == 14) {
		var leveldata = [[2,2,2,2,2,1,1,2,1,1,2,2],
						 [2,2,1,6,1,1,7,1,1,6,1,2],
						 [2,3,1,1,5,2,1,2,2,1,1,2],
						 [2,2,2,1,1,8,5,8,1,1,2,2],
						 [2,2,1,1,2,2,1,2,5,1,1,3],
						 [2,2,1,6,1,1,7,1,1,1,4,2],
						 [2,2,1,1,2,1,1,2,2,2,2,2],
						 [2,2,2,2,2,2,2,2,2,2,2,2],
						 [5, 10]];
	} else {
		var leveldata = [[1,1,1,3,1,3,1,3,1,3,1,2],
						 [1,1,1,3,1,3,1,3,1,3,1,2],
						 [1,8,7,3,1,3,1,3,1,3,1,6],
						 [1,7,1,3,1,3,7,3,1,3,1,2],
						 [1,8,1,3,1,3,1,3,1,3,1,2],
						 [4,1,1,3,7,3,1,3,1,3,1,2],
						 [1,1,7,3,1,3,1,3,7,3,1,2],
						 [1,1,7,3,1,3,1,3,1,3,1,2],
						 [5, 0]];
	}

	tiles = new Array(new Array(12),
					  new Array(12),
					  new Array(12),
					  new Array(12),
					  new Array(12),
					  new Array(12),
					  new Array(12),
					  new Array(12));

	for (var row = 0; row < 8; row++) {
		for (var column = 0; column < 12; column++) {
			tiles[row][column] = _root.attachMovie("tile",
			  "tile" + row + "-" + column, row * 12 + column);
			tiles[row][column]._y = row * 16;
			tiles[row][column]._x = column * 16;
			changeTile(row, column, leveldata[row][column]);
		}
	}

	playery = leveldata[8][0];
	playerx = leveldata[8][1];

	message = _root.attachMovie("message", "message", 100);
	message._x = 0;
	message._y = 128;
	messageshowing = 0;
	
	selectingpiece = 0;
}

function movePlayer(down, right) {
	// if you can move
	if (playery + down <= 7 && playery + down >= 0 &&			// if this block: not moving off the screen
	  playerx + right <= 11 && playerx + right >= 0 &&			// [see above]
	  getTile(playery+down, playerx+right) != 2 &&				// not moving into a solid block
	  messageshowing == 0 && selectingpiece == 0 &&				// no message showing and not selecting a plus block piece
	  (getTile(playery+down, playerx+right) <= 4 ||				// (not moving into a pushable block OR
	  (playery + 2*down <= 7 && playery + 2*down >= 0 &&		// (not pushing it off the screen
	  playerx + 2*right <= 11 && playerx + 2*right >= 0 &&		// [see above]
	  getTile(playery+2*down, playerx+2*right) != 2)) ) {		// not pushing it into a solid block))
		
		// set up for move
		changeTile(playery, playerx, 1);						// make tile where player is blank
		playery += down;										// change coordinates to where you are moving to
		playerx += right;										// [see above]
		
		// interact with blocks
		if (getTile(playery, playerx) >= 5) {					// if moving into a block
			if (getTile(playery+down, playerx+right) == 1)		// if pushing it into a blank space
				changeTile(playery+down, playerx+right,			// change where you're pushing it into to the right block
				  getTile(playery, playerx));
			else if (getTile(playery, playerx) ==
			  getTile(playery+down, playerx+right)) {			// if you're pushing two like blocks together
				if (getTile(playery, playerx) == 5 ||			// if it's a circle...
				  getTile(playery, playerx) == 7)				// or a square
					changeTile(playery+down, playerx+right, 1);	// change where you pushed it into a blank space
				if (getTile(playery, playerx) == 6)				// if it's a triangle
					changeTile(playery+down, playerx+right, 2);	// change where you pushed it into a solid block
				if (getTile(playery, playerx) == 8) {			// if it's a plus
					changeTile(playery+down, playerx+right, 6);	// change where you pushed it into a triangle
					changeTile(playery, playerx, 1);			// change where the player now is into a blank space
					if (right == 1 && down == 0)				// if moving right
						selectingpiece = 1;						// set direction of piece to right
					if (right == -1 && down == 0)				// if moving left
						selectingpiece = 2;						// set direction of piece to left
					if (right == 0 && down == 1)				// if moving down
						selectingpiece = 3;						// set direction of piece to down
					if (right == 0 && down == -1)				// if moving up
						selectingpiece = 4;						// set direction of piece to up
				}
			} else if (tiles[playery+down][playerx+right]
			  ._currentframe >= 5 &&							// if pushing a block into a block
			  getTile(playery+down, playerx+right) !=			// the second block is not the same as...
			  getTile(playery, playerx)) {						// the first block
				message.gotoAndStop(3);							// show a message saying they don't match
				messageshowing = 2;								// remember that that message is showing
			} else if (getTile(playery, playerx) == 7 &&		// if moving into a square block
			  getTile(playery+down, playerx+right) == 3)		// pushing it into a hole
				changeTile(playery+down, playerx+right, 1);		// remove the hole
		}
		
		// actually move the piece
		if (getTile(playery, playerx) != 3 &&					// if not moving into a hole
		  messageshowing == 0 && selectingpiece == 0) {			// no message showing and not choosing plus block block
			changeTile(playery, playerx, 4);					// move player
		} else if (getTile(playery, playerx) == 3) {			// if moving into a hole
			message.gotoAndStop(4);								// show message saying you fell and died
			messageshowing = 3;									// remember that that message is showing
		}
		
		// see if you've won
		blockfound = 0;
		for (var row = 0; row <= 7 && blockfound == 0; row++) {
			for (var column = 0; column <= 11 && blockfound == 0;
			  column++) {
				if (getTile(row, column) >= 5)
					blockfound = 1;
			}
		}
		if (blockfound == 0) {
			changeTile(playery, playerx, 1);
			changeTile(playery-down, playerx-right, 4);
			message.gotoAndStop(2);
			messageshowing = 1;
		}
		
	// if selecting what to turn two plus blocks into
	} else if (selectingpiece != 0 && down != 0) {
		if (selectingpiece == 1) {
			ycoor = playery;
			xcoor = playerx + 1;
		} else if (selectingpiece == 2) {
			ycoor = playery;
			xcoor = playerx - 1;
		} else if (selectingpiece == 3) {
			ycoor = playery + 1;
			xcoor = playerx;
		} else {
			ycoor = playery - 1;
			xcoor = playerx;
		}
		
		var blocktype = getTile(ycoor, xcoor);
		if (down == 1) {
			if (blocktype == 5)
				blocktype = 6;
			else if (blocktype == 6)
				blocktype = 8;
			else if (blocktype == 7)
				blocktype = 5;
			else
				blocktype = 7;
		} else {
			if (blocktype == 5)
				blocktype = 7;
			else if (blocktype == 6)
				blocktype = 5;
			else if (blocktype == 7)
				blocktype = 8;
			else
				blocktype = 6;
		}
		
		changeTile(ycoor, xcoor, blocktype);
	}
}

function changeTile(ycoor, xcoor, changeto) {
	tiles[ycoor][xcoor].gotoAndStop(changeto);
}

function getTile(ycoor, xcoor) {
	return tiles[ycoor][xcoor]._currentframe;
}

stop();
