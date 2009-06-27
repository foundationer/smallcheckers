<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on June 27, 2009 at 7:46:08 am</time-stamp>
<!-- Package Changes for Chekers-Test* -->


<remove-selector>
<class-id>InvalidTurnException</class-id> <selector>initialize</selector>
</remove-selector>

<remove-selector>
<class-id>InvalidTurnException</class-id> <selector>initializeWithDescription:</selector>
</remove-selector>

<remove-selector>
<class-id>InvalidTurnException class</class-id> <selector>with:</selector>
</remove-selector>

<class>
<name>CheckersPieceTest</name>
<environment>Smalltalk</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Chekers-Test</package>
</attributes>
</class>

<methods>
<class-id>CheckersPieceTest</class-id> <category>initialize-release</category>

<body package="Chekers-Test" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Chekers-Test" selector="TestMoveToAnOccupySquare">TestMoveToAnOccupySquare
	"Testea que no se pueda realizar algun movimiento a una casilla ocupada"
	
	| board aPiece aPoint |
	board := CheckersBoard rows: 8 columns: 8.
	aPiece := CheckersPiece newBlackIn: board.
	aPoint := 1 @ 1.
	CheckersPiece newBlackIn: board.
	2 @ 2.
	board occupySquareAt: aPoint with: aPiece.
	self
		should: [board move: aPiece to: aPoint]
		raise: IllegalMovementException</body>

<body package="Chekers-Test" selector="TestPieceCreation">TestPieceCreation
	
	| aBlackPiece aWhitePiece |
	aBlackPiece := CheckersPiece newBlackIn: nil.
	aWhitePiece := CheckersPiece newWhiteIn: nil.
	self
		assert: aBlackPiece isBlack;
		assert: aWhitePiece isWhite;
		deny: aBlackPiece isWhite;
		deny: aWhitePiece isBlack;
		deny: aWhitePiece = aBlackPiece;
		deny: aWhitePiece isCrowned;
		deny: (aBlackPiece hasSameColorThan: aWhitePiece)</body>

<body package="Chekers-Test" selector="TestPieceCrown">TestPieceCrown
	
	| aCheckersPiece |
	aCheckersPiece := CheckersPiece newBlackIn: nil.
	aCheckersPiece crown.
	self assert: aCheckersPiece isCrowned</body>

<body package="Chekers-Test" selector="TestPieceMovement">TestPieceMovement
	
	| aBoard aPiece aPoint oldPosition newPosition |
	aBoard := CheckersBoard rows: 8 columns: 8.
	aPiece := CheckersPiece newBlackIn: aBoard.
	aPoint := 1 @ 1.
	aBoard occupySquareAt: aPoint with: aPiece.
	oldPosition := aBoard positionOf: aPiece.
	aBoard
		move: aPiece
		to: 2 @ 2.
	newPosition := aBoard positionOf: aPiece.
	self
		deny: oldPosition = newPosition;
		deny: (aBoard hasAPieceAt: oldPosition);
		assert: (aBoard hasAPieceAt: newPosition)</body>

<body package="Chekers-Test" selector="TestPiecePositionInTable">TestPiecePositionInTable

| aTable aPiece aPoint |

aTable := CheckersBoard rows: 8 columns: 8.
aPiece := CheckersPiece new.
aPoint := 1.
aTable occupySquareAt: aPoint with: aPiece.
self assert:  ( aTable positionOf: aPiece ) = aPoint</body>
</methods>

<class>
<name>CheckersBoardTest</name>
<environment>Smalltalk</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Chekers-Test</package>
</attributes>
</class>

<methods>
<class-id>CheckersBoardTest</class-id> <category>initialize-release</category>

<body package="Chekers-Test" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Chekers-Test" selector="testFreeASquare">testFreeASquare

	| checkersTable piece tablePoint |
	checkersTable := CheckersBoard rows: 8 columns: 8.
	piece := CheckersPiece new.
	tablePoint := Point x: 1 y: 2.
	checkersTable occupySquareAt: tablePoint with: piece.
	checkersTable freeSquareAt: tablePoint.
	self deny: ( checkersTable hasAPieceAt: tablePoint)
	</body>

<body package="Chekers-Test" selector="testNumberOfBoxForATable">testNumberOfBoxForATable

| damasTable |
	damasTable := CheckersBoard rows: 8 columns: 8.
	self assert: damasTable columns = 8.
 	self assert: damasTable rows = 8.</body>

<body package="Chekers-Test" selector="testOcuppyASquare">testOcuppyASquare

	| damasTable  aPiece aDefinedTablePoint aNotDefinedTablePoint |

	damasTable := CheckersBoard rows: 8 columns: 8.
	aDefinedTablePoint := Point x: 1 y: 1.
	aNotDefinedTablePoint := Point x: 2 y: 1.
	aPiece := 'somePiece'.
	damasTable occupySquareAt: aDefinedTablePoint with: aPiece.
	self assert: (damasTable hasAPieceAt: aDefinedTablePoint).
	self deny: (damasTable hasAPieceAt: aNotDefinedTablePoint).</body>

<body package="Chekers-Test" selector="testOcuppyBoxInARange">testOcuppyBoxInARange
	
	| damasTable  aPiece aDefinedTablePoint |
	
	damasTable := CheckersBoard rows: 8 columns: 8.
	aDefinedTablePoint := 65.
	aPiece := 'somePiece'.
	self 
		should: [damasTable occupySquareAt: aDefinedTablePoint with: aPiece]
		raise: PositionOutOfTableException.</body>

<body package="Chekers-Test" selector="testPositiveNumberOfBoxes">testPositiveNumberOfBoxes
	self
		should: [	CheckersBoard rows: -8 columns: -8]
		raise: CanNotCreateTableException.</body>

<body package="Chekers-Test" selector="testTotalNumberOfBoxesInATable">testTotalNumberOfBoxesInATable

	| damasTable |
	damasTable := CheckersBoard rows: 8 columns: 8.
	self assert: damasTable numberOfSquares = 64.</body>

<body package="Chekers-Test" selector="testWhitePieces">testWhitePieces
	
	| damasTable aWhitePiece |
	damasTable := CheckersBoard rows: 8 columns: 8.
	aWhitePiece := CheckersPiece newWhiteIn: nil.
	damasTable
		occupySquareAt: (Point x: 1 y: 2)
		with: aWhitePiece.
	self assert: (damasTable whitePieces includes: aWhitePiece)</body>
</methods>

<methods>
<class-id>CheckersPieceTest class</class-id> <category>instance creation</category>

<body package="Chekers-Test" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<methods>
<class-id>CheckersBoardTest class</class-id> <category>instance creation</category>

<body package="Chekers-Test" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<class>
<name>CheckersPlayerTest</name>
<environment>Smalltalk</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Chekers-Test</package>
</attributes>
</class>

<methods>
<class-id>CheckersPlayerTest</class-id> <category>initialize-release</category>

<body package="Chekers-Test" selector="checkersGame">checkersGame
	
	^CheckersGame
		withBlackPlayer: (Player named: 'jose')
		andWhitePlayer: (Player named: 'Computer')</body>

<body package="Chekers-Test" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Chekers-Test" selector="testPlayerCreation">testPlayerCreation
	
	| aPlayer |
	aPlayer := Player named: 'Pepe'.
	self assert: aPlayer name = 'Pepe'</body>
</methods>

<class>
<name>CheckersGameTest</name>
<environment>Smalltalk</environment>
<super>CheckersPieceTest</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars>checkersGame </class-inst-vars>
<imports></imports>
<category>Chekers-Test</category>
<attributes>
<package>Chekers-Test</package>
</attributes>
</class>

<methods>
<class-id>CheckersGameTest</class-id> <category>initialize-release</category>

<body package="Chekers-Test" selector="checkersGame">checkersGame
	
	^CheckersGame withBlackPlayer: 'human' andWhitePlayer: 'computer'</body>
</methods>

<methods>
<class-id>CheckersGameTest</class-id> <category>As yet unclassified</category>

<body package="Chekers-Test" selector="movements">movements
	self halt</body>

<body package="Chekers-Test" selector="testCrowningPiece">testCrowningPiece
	
	| game blackPlayer aPiece blackMovement |
	game := CheckersGame withCrowningConfiguration.
	blackPlayer := game currentPlayer.
	aPiece := game board pieceAtSquare: 1 @ 7.
	blackMovement := blackPlayer
		move: aPiece
		to: 2 @ 8
		in: game checkersBoard.
	game makeMove: blackMovement.
	self assert: aPiece isCrowned</body>

<body package="Chekers-Test" selector="testPlayersCreation">testPlayersCreation
	
	| blackPlayer whitePlayer game |
	game := CheckersGame withBlackPlayer: 'human' andWhitePlayer: 'computer'.
	blackPlayer := game blackPlayer.
	whitePlayer := game whitePlayer.
	self deny: blackPlayer = whitePlayer</body>

<body package="Chekers-Test" selector="testQueenMovement">testQueenMovement
	
	| game blackPlayer aPiece blackMovement anotherBlackMovement aWhitePiece whiteMovement whitePlayer |
	game := CheckersGame withCrowningConfiguration.
	blackPlayer := game currentPlayer.
	aPiece := game board pieceAtSquare: 1 @ 7.
	blackMovement := blackPlayer
		move: aPiece
		to: 2 @ 8
		in: game checkersBoard.
	game makeMove: blackMovement.
	aWhitePiece := game board pieceAtSquare: 3 @ 3.
	whitePlayer := game currentPlayer.
	whiteMovement := whitePlayer
		move: aWhitePiece
		to: 4 @ 4
		in: game checkersBoard.
	game makeMove: whiteMovement.
	anotherBlackMovement := blackPlayer
		move: aPiece
		to: 8 @ 2
		in: game checkersBoard.
	game makeMove: anotherBlackMovement.
	self assert: (game checkersBoard positionOf: aPiece) = (8 @ 2)</body>
</methods>

<methods>
<class-id>CheckersGameTest</class-id> <category>testing turnToPlay</category>

<body package="Chekers-Test" selector="testInvalidTurnToPlay">testInvalidTurnToPlay
	
	| game whitePlayer aPiece aMovement board |
	game := self checkersGame.
	whitePlayer := game whitePlayer.
	aPiece := game checkersBoard pieceAtSquare: 1 @ 3.
	board := game checkersBoard.
	aMovement := whitePlayer
		move: aPiece
		to: 2 @ 4
		in: board.
	game makeMove: aMovement.
	aPiece := game checkersBoard pieceAtSquare: 2 @ 4.
	aMovement := whitePlayer
		move: aPiece
		to: 1 @ 5
		in: board.
	self
		should: [game makeMove: aMovement]
		raise: InvalidTurnException</body>
</methods>

<methods>
<class-id>CheckersGameTest</class-id> <category>testing NormalPieceMovements</category>

<body package="Chekers-Test" selector="testFistBlackJumpMove">testFistBlackJumpMove
	
	| game blackPlayer aPiece whitePlayer blackMovement whiteMovement |
	game := CheckersGame withBlackPlayer: 'human' andWhitePlayer: 'computer'.
	blackPlayer := game nextPlayerToMove.
	aPiece := game board pieceAtSquare: 5 @ 3.
	blackMovement := blackPlayer
		move: aPiece
		to: 6 @ 4
		in: game checkersBoard.
	game makeMove: blackMovement.
	whitePlayer := game nextPlayerToMove.
	aPiece := game board pieceAtSquare: 4 @ 6.
	whiteMovement := whitePlayer
		move: aPiece
		to: 5 @ 5
		in: game checkersBoard.	"ahora tratamos de saltar"
	game makeMove: whiteMovement.
	blackPlayer := game nextPlayerToMove.
	aPiece := game board pieceAtSquare: 6 @ 4.
	blackMovement := blackPlayer
		jump: aPiece
		to: 4 @ 6
		in: game checkersBoard.
	game makeJump: blackMovement.
	self
		deny: (game board hasAPieceAt: 5 @ 5);
		assert: game piecesInGame size = 23;
		assert: game removedPieces size = 1;
		assert: game whitePiecesInGame size = 11;
		assert: game blackPiecesInGame size = 12</body>

<body package="Chekers-Test" selector="testFistBlackMove">testFistBlackMove
	
	| game blackPlayer aPiece blackMovement |
	game := CheckersGame withBlackPlayer: 'human' andWhitePlayer: 'computer'.
	blackPlayer := game currentPlayer.
	aPiece := game board pieceAtSquare: 5 @ 3.
	blackMovement := blackPlayer
		move: aPiece
		to: 6 @ 4
		in: game checkersBoard.
	game makeMove: blackMovement.
	self
		assert: game currentPlayer = game whitePlayer;
		deny: (game board hasAPieceAt: 5 @ 3);
		assert: (game board hasAPieceAt: 6 @ 4)</body>
</methods>

<methods>
<class-id>CheckersGameTest</class-id> <category>test accessing</category>

<body package="Chekers-Test" selector="testBlackPiecesAmount">testBlackPiecesAmount
	
	| game |
	game := CheckersGame withBlackPlayer: 'human' andWhitePlayer: 'computer'.
	self assert: game blackPiecesInGame size = 12</body>

<body package="Chekers-Test" selector="testCurrentPlayer">testCurrentPlayer
	
	| blackPlayer game |
	game := CheckersGame withBlackPlayer: 'human' andWhitePlayer: 'computer'.
	blackPlayer := game blackPlayer.
	self assert: game currentPlayer = blackPlayer</body>

<body package="Chekers-Test" selector="testInitialRemovedPiecesInGame">testInitialRemovedPiecesInGame
	
	| game |
	game := CheckersGame withBlackPlayer: 'human' andWhitePlayer: 'computer'.
	self assert: game removedPieces size = 0</body>

<body package="Chekers-Test" selector="testMovementHistory">testMovementHistory
	
	| game aPiece aMovement blackPlayer |
	game := self checkersGame.
	blackPlayer := game blackPlayer.
	aPiece := game board pieceAtSquare: 1 @ 3.
	aMovement := blackPlayer
		move: aPiece
		to: 2 @ 4
		in: game board.
	game makeMove: aMovement.
	self assert: (game movements includes: aMovement)</body>

<body package="Chekers-Test" selector="testNextPlayer">testNextPlayer
	
	| game whitePlayer |
	game := CheckersGame withBlackPlayer: 'human' andWhitePlayer: 'computer'.
	whitePlayer := game whitePlayer.
	self assert: game nextPlayerToMove = whitePlayer</body>

<body package="Chekers-Test" selector="testTotalPiecesInGame">testTotalPiecesInGame
	
	| game |
	game := CheckersGame withBlackPlayer: 'human' andWhitePlayer: 'computer'.
	self assert: game piecesInGame size = 24</body>

<body package="Chekers-Test" selector="testWhitePiecesAmount">testWhitePiecesAmount
	
	| game |
	game := CheckersGame withBlackPlayer: 'human' andWhitePlayer: 'computer'.
	self assert: game whitePiecesInGame size = 12</body>
</methods>

<reorganize>
<class-id>CheckersGameTest</class-id> <organization>('initialize-release' #checkersGame)
('As yet unclassified' #movements #testCrowningPiece #testPlayersCreation #testQueenMovement)
('testing turnToPlay' #testInvalidTurnToPlay)
('testing NormalPieceMovements' #testFistBlackJumpMove #testFistBlackMove)
('test accessing' #testBlackPiecesAmount #testCurrentPlayer #testInitialRemovedPiecesInGame #testMovementHistory #testNextPlayer #testTotalPiecesInGame #testWhitePiecesAmount)
</organization>
</reorganize>


</st-source>
