<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on June 27, 2009 at 7:46:03 am</time-stamp>
<!-- Package Changes for Checkers* -->


<class>
<name>CheckersGame</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>aCheckersBoard removedPieces blackPlayer whitePlayer rules currentPlayer movements </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>My Classes</category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>CheckersGame</class-id> <category>accessing</category>

<body package="Checkers" selector="blackPiecesInGame">blackPiecesInGame
	^ aCheckersBoard blackPieces.</body>

<body package="Checkers" selector="checkersBoard">checkersBoard
	 ^ aCheckersBoard</body>

<body package="Checkers" selector="testMovementHistory">testMovementHistory
	
	| game aPiece aMovement |
	game := self checkersGame.
	blackPlayer := game blackPlayer.
	aPiece := game board pieceAt: 1 @ 3.
	aMovement := blackPlayer
		move: aPiece
		to: 2 @ 4
		in: game board.
	self movements include: aMovement</body>

<body package="Checkers" selector="whitePiecesInGame">whitePiecesInGame
	^ aCheckersBoard whitePieces.</body>
</methods>

<methods>
<class-id>CheckersGame</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="applyCrownRuleTo:">applyCrownRuleTo: aMovement 
	aMovement piece tryToCrown.</body>

<body package="Checkers" selector="blackPlayer">blackPlayer
	^ blackPlayer.</body>

<body package="Checkers" selector="board">board
	^ aCheckersBoard</body>

<body package="Checkers" selector="currentPlayer">currentPlayer
	
	^currentPlayer</body>

<body package="Checkers" selector="initializeWithCrowningConfiguration">initializeWithCrowningConfiguration
	
	aCheckersBoard := CheckersBoard rows: 8 columns: 8.
	aCheckersBoard
		occupySquareAt: 1 @ 7
			with: (CheckersPiece newBlackIn: aCheckersBoard);
		occupySquareAt: 3 @ 3
			with: (CheckersPiece newWhiteIn: aCheckersBoard).
	blackPlayer := Player blackNamed: 'aBlackPlayerName'.
	whitePlayer := Player whiteNamed: 'aWhitePlayerName'.
	currentPlayer := blackPlayer.
	movements := List new.
	removedPieces := Set new.
	aCheckersBoard addDependent: self</body>

<body package="Checkers" selector="makeJump:">makeJump: aMovement
	
	aMovement piece jumpTo: aMovement to.
	movements add: aMovement.
	currentPlayer := self nextPlayerToMove</body>

<body package="Checkers" selector="makeMove:">makeMove: aMovement
	
	(aMovement piece isBlack = self currentPlayer isBlack) not
		ifTrue:
			[InvalidTurnException with:
					'Movimiento invalido, es turno del otro jugador'].	"TODO extract to method"
	aMovement piece moveTo: aMovement to.	"(self checkersBoard isEdge: aMovement to) ifTrue: [aMovement piece crown]."
	self applyCrownRuleTo: aMovement.
	movements add: aMovement.
	currentPlayer := self nextPlayerToMove</body>

<body package="Checkers" selector="movements">movements
	^ movements.</body>

<body package="Checkers" selector="nextPlayerToMove">nextPlayerToMove
	
	^self opponent: currentPlayer</body>

<body package="Checkers" selector="pieceAt:">pieceAt: aSquareNumber
	
	^aCheckersBoard pieceAt: aSquareNumber</body>

<body package="Checkers" selector="pieceAtSquare:">pieceAtSquare: aSquareNumber 
	^ aCheckersBoard pieceAtSquare: aSquareNumber.</body>

<body package="Checkers" selector="piecesFor:">piecesFor: aPlayer 

	|pieces|

	(aPlayer = blackPlayer) ifTrue:[ pieces := self blackPiecesInGame].
	(aPlayer = whitePlayer) ifTrue:[ pieces := self whitePiecesInGame].


	^pieces.</body>

<body package="Checkers" selector="piecesInGame">piecesInGame
	^ aCheckersBoard pieces.</body>

<body package="Checkers" selector="removedPieces">removedPieces
	^ removedPieces.  </body>

<body package="Checkers" selector="rules">rules
	^ rules.</body>

<body package="Checkers" selector="whitePlayer">whitePlayer
	^ whitePlayer.</body>
</methods>

<methods>
<class-id>CheckersGame</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Checkers" selector="initializeWithBasicConfiguration">initializeWithBasicConfiguration
	
	aCheckersBoard := CheckersBoard rows: 8 columns: 8.	
	aCheckersBoard
		occupySquareAt: 1 @ 1
			with: (CheckersPiece newBlackIn: aCheckersBoard);
		occupySquareAt: 3 @ 1
			with: (CheckersPiece newBlackIn: aCheckersBoard);
		occupySquareAt: 5 @ 1
			with: (CheckersPiece newBlackIn: aCheckersBoard);
		occupySquareAt: 7 @ 1
			with: (CheckersPiece newBlackIn: aCheckersBoard);
		occupySquareAt: 2 @ 2
			with: (CheckersPiece newBlackIn: aCheckersBoard);
		occupySquareAt: 4 @ 2
			with: (CheckersPiece newBlackIn: aCheckersBoard);
		occupySquareAt: 6 @ 2
			with: (CheckersPiece newBlackIn: aCheckersBoard);
		occupySquareAt: 8 @ 2
			with: (CheckersPiece newBlackIn: aCheckersBoard);
		occupySquareAt: 1 @ 3
			with: (CheckersPiece newBlackIn: aCheckersBoard);
		occupySquareAt: 3 @ 3
			with: (CheckersPiece newBlackIn: aCheckersBoard);
		occupySquareAt: 5 @ 3
			with: (CheckersPiece newBlackIn: aCheckersBoard);
		occupySquareAt: 7 @ 3
			with: (CheckersPiece newBlackIn: aCheckersBoard).	"ahora creamos  y asignamos las piezas blancas al tablero"
	aCheckersBoard
		occupySquareAt: 2 @ 6
			with: (CheckersPiece newWhiteIn: aCheckersBoard);
		occupySquareAt: 4 @ 6
			with: (CheckersPiece newWhiteIn: aCheckersBoard);
		occupySquareAt: 6 @ 6
			with: (CheckersPiece newWhiteIn: aCheckersBoard);
		occupySquareAt: 8 @ 6
			with: (CheckersPiece newWhiteIn: aCheckersBoard);
		occupySquareAt: 1 @ 7
			with: (CheckersPiece newWhiteIn: aCheckersBoard);
		occupySquareAt: 3 @ 7
			with: (CheckersPiece newWhiteIn: aCheckersBoard);
		occupySquareAt: 5 @ 7
			with: (CheckersPiece newWhiteIn: aCheckersBoard);
		occupySquareAt: 7 @ 7
			with: (CheckersPiece newWhiteIn: aCheckersBoard);
		occupySquareAt: 2 @ 8
			with: (CheckersPiece newWhiteIn: aCheckersBoard);
		occupySquareAt: 4 @ 8
			with: (CheckersPiece newWhiteIn: aCheckersBoard);
		occupySquareAt: 6 @ 8
			with: (CheckersPiece newWhiteIn: aCheckersBoard);
		occupySquareAt: 8 @ 8
			with: (CheckersPiece newWhiteIn: aCheckersBoard).
	aCheckersBoard addDependent: self</body>

<body package="Checkers" selector="initializeWithBlackPlayer:andWhitePlayer:">initializeWithBlackPlayer: aBlackPlayerName andWhitePlayer: aWhitePlayerName
	
	self initializeWithBasicConfiguration.
	blackPlayer := Player blackNamed: aBlackPlayerName.
	whitePlayer := Player whiteNamed: aWhitePlayerName.
	currentPlayer := blackPlayer.
	removedPieces := Set new.
	movements := List new.
	blackPlayer addDependent: self.
	whitePlayer addDependent: self</body>

<body package="Checkers" selector="initializeWithJumpConfiguration">initializeWithJumpConfiguration
	aCheckersBoard :=CheckersBoard rows: 8 columns: 8.

	theNormalRole := NormalRole for: aCheckersBoard.
	"theQueenRole := NormalRole for: aCheckersTable."

	aCheckersBoard
					occupySquareAt: 1 with: ( CheckersPiece newBlackWithRole: theNormalRole );
					occupySquareAt: 10 with: ( CheckersPiece newWhiteWithRole: theNormalRole );
					occupySquareAt: 3 with: ( CheckersPiece newBlackWithRole: theNormalRole );
					occupySquareAt: 12 with: ( CheckersPiece newWhiteWithRole: theNormalRole );
					occupySquareAt: 30 with: ( CheckersPiece newWhiteWithRole: theNormalRole )</body>

<body package="Checkers" selector="opponent:">opponent: aPlayer
	
	self blackPlayer = aPlayer
		ifTrue: [^whitePlayer]
		ifFalse: [^blackPlayer]</body>
</methods>

<methods>
<class-id>CheckersGame</class-id> <category>updating</category>

<body package="Checkers" selector="crown:">crown: aPiece
	
	aPiece crown</body>

<body package="Checkers" selector="update:with:">update: aSymbol with: aPiece
	
	aSymbol = #crown ifTrue: [aPiece crown].
	(aSymbol = #remove and: [(self board pieces includes: aPiece) not])
		ifTrue: [removedPieces add: aPiece]</body>
</methods>

<reorganize>
<class-id>CheckersGame</class-id> <organization>('accessing' #blackPiecesInGame #checkersBoard #testMovementHistory #whitePiecesInGame)
('As yet unclassified' #applyCrownRuleTo: #blackPlayer #board #currentPlayer #initializeWithCrowningConfiguration #makeJump: #makeMove: #movements #nextPlayerToMove #pieceAt: #pieceAtSquare: #piecesFor: #piecesInGame #removedPieces #rules #whitePlayer)
('initialize-release' #initialize #initializeWithBasicConfiguration #initializeWithBlackPlayer:andWhitePlayer: #initializeWithJumpConfiguration #opponent:)
('updating' #crown: #update:with:)
</organization>
</reorganize>

<methods>
<class-id>CheckersGame class</class-id> <category>instance creation</category>

<body package="Checkers" selector="withBlackPlayer:andWhitePlayer:">withBlackPlayer: aPlayerName andWhitePlayer: anotherPlayerName
	
	^self new initializeWithBlackPlayer: aPlayerName andWhitePlayer:
			anotherPlayerName</body>

<body package="Checkers" selector="withInitialConfiguration">withInitialConfiguration
	^ self new initializeWithBasicConfiguration</body>

<body package="Checkers" selector="withJumpConfiguration">withJumpConfiguration
	^ self new initializeWithJumpConfiguration</body>
</methods>

<methods>
<class-id>CheckersGame class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="withCrowningConfiguration">withCrowningConfiguration
	
	^self new initializeWithCrowningConfiguration</body>
</methods>

<class>
<name>Movement</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>target aBoard aPiece source </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>Movement</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>Movement</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="diagonalDistance">diagonalDistance
	
	^aBoard
		diagonalDistanceBetween: self from
		and: target</body>

<body package="Checkers" selector="from">from
	
	^ source.</body>

<body package="Checkers" selector="in">in
	^ aBoard.</body>

<body package="Checkers" selector="initializeMovementMadeBy:to:in:">initializeMovementMadeBy: aCheckersPiece to: aDestination in: aCheckersBoard
	
	aPiece := aCheckersPiece.
	target := aDestination.
	aBoard := aCheckersBoard.
	source := aCheckersBoard positionOf: aCheckersPiece</body>

<body package="Checkers" selector="isDiagonal">isDiagonal
	| distance |
	distance := self from - target.
	^ distance x = distance y.</body>

<body package="Checkers" selector="isJump">isJump
	
	^self diagonalDistance &gt; 1</body>

<body package="Checkers" selector="piece">piece
	^ aPiece.</body>

<body package="Checkers" selector="to">to
	^ target.</body>
</methods>

<methods>
<class-id>Movement class</class-id> <category>instance creation</category>

<body package="Checkers" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<methods>
<class-id>Movement class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="madeBy:to:in:">madeBy: aCheckersPiece to: aDestination in: aCheckersBoard
	
	^self new initializeMovementMadeBy: aCheckersPiece to: aDestination in:
			aCheckersBoard</body>
</methods>

<class>
<name>PositionOutOfTableException</name>
<environment>Smalltalk</environment>
<super>Core.Error</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>description </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>PositionOutOfTableException</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>PositionOutOfTableException</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="initializeWithDescription:">initializeWithDescription: aDescriptionError
	description := aDescriptionError</body>
</methods>

<methods>
<class-id>PositionOutOfTableException class</class-id> <category>instance creation</category>

<body package="Checkers" selector="with:">with: anErrorDescription

	^(self new initializeWithDescription: anErrorDescription) raiseSignal.</body>
</methods>

<class>
<name>JumpMovement</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>aPiece target source aPlace </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>JumpMovement</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>JumpMovement</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="from">from
	
	^source.</body>

<body package="Checkers" selector="initializeMovementMadeBy:to:in:">initializeMovementMadeBy: aCheckersPiece to: aPointInTable in: aCheckersBoard
	
	aPiece := aCheckersPiece.
	target := aPointInTable.
	source := aCheckersBoard positionOf: aCheckersPiece.
	aPlace := aCheckersBoard</body>

<body package="Checkers" selector="over">over
	^ aPlace squareBetween: (self from) and: target.</body>

<body package="Checkers" selector="piece">piece
	
	^aPiece</body>

<body package="Checkers" selector="to">to
	
	^target</body>
</methods>

<class>
<name>CheckersBoard</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>columnAmount rowAmount tableGrid </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>CheckersBoard</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="blackPieces">blackPieces
	
	^ self pieces select: [:aPiece | aPiece isBlack].</body>

<body package="Checkers" selector="diagonalDistance">diagonalDistance
	self halt</body>

<body package="Checkers" selector="diagonalDistanceBetween:and:">diagonalDistanceBetween: aSquareNumber and: anotherSquareNumber
	^ ( anotherSquareNumber dist: aSquareNumber ) floor</body>

<body package="Checkers" selector="freeSquareAt:">freeSquareAt: aSquareNumber
	
	| piece |
	piece := self pieceAtSquare: aSquareNumber.
	tableGrid removeKey: aSquareNumber.
	self changed: #remove with: piece</body>

<body package="Checkers" selector="hasLeftNeighbor:">hasLeftNeighbor: aSquareNumber

	(self isPointOutOfTable: aSquareNumber)
		ifFalse: [ ^ ((aSquareNumber % 8) = 1) ]
		ifTrue: [ PositionOutOfTableException with: 'La posición indicada no forma parte del tablero' ]</body>

<body package="Checkers" selector="hasLowerNeighbor:">hasLowerNeighbor: aSquareNumber

	(self isPointOutOfTable: aSquareNumber)
		ifFalse: [ ^ (aSquareNumber &gt; 8 ) ]
		ifTrue: [ PositionOutOfTableException with: 'La posición indicada no forma parte del tablero' ]</body>

<body package="Checkers" selector="hasRightNeighbor:">hasRightNeighbor: aSquareNumber

	(self isPointOutOfTable: aSquareNumber)
		ifFalse: [ ^ ((aSquareNumber % 8) = 0) ]
		ifTrue: [ PositionOutOfTableException with: 'La posición indicada no forma parte del tablero' ]</body>

<body package="Checkers" selector="hasUpperNeighbor:">hasUpperNeighbor: aSquareNumber

	(self isPointOutOfTable: aSquareNumber)
		ifFalse: [ ^ (aSquareNumber &lt; 57) ]
		ifTrue: [ PositionOutOfTableException with: 'La posición indicada no forma parte del tablero' ]</body>

<body package="Checkers" selector="isNorthEdge:">isNorthEdge: aPoint 
	^aPoint y = self rows</body>

<body package="Checkers" selector="numberOfSquares">numberOfSquares
	^ columnAmount * rowAmount.</body>

<body package="Checkers" selector="occupySquareAt:with:">occupySquareAt: aSquareNumber with: aPiece
	
	(self isPointOutOfTable: aSquareNumber)
		ifTrue:
			[PositionOutOfTableException with:
					'No se puede realizar un movimiento fuera del tablero '].
	(self hasAPieceAt: aSquareNumber)
		ifTrue:
			[IllegalMovementException with: 'La casilla ya se encuentra ocupada ']
		ifFalse: [^tableGrid at: aSquareNumber put: aPiece]</body>

<body package="Checkers" selector="pieceAtSquare:">pieceAtSquare: aSquareNumber

	^ [ tableGrid at: aSquareNumber ]
	   on: KeyNotFoundError
	   do: [:anException |  PieceNotFoundException with: ' No existe una pieza en la posicion ' , aSquareNumber ]</body>

<body package="Checkers" selector="pieces">pieces
	^ tableGrid values.</body>

<body package="Checkers" selector="piecesBetween:and:">piecesBetween: aSquareNumber and: anotherSquareNumber
	
	^self notYetImplemented</body>

<body package="Checkers" selector="positionOf:">positionOf: aCheckersPiece 
	^[ tableGrid keyAtValue: aCheckersPiece ]
	 on: ValueNotFoundError 
	 do: [ :anException | (PieceNotFoundException with: 'No existe la pieza en el tablero') ]</body>

<body package="Checkers" selector="squareBetween:and:">squareBetween: aSquarePoint and: anotherSquarePoint
	| row column |
	column := (aSquarePoint x + anotherSquarePoint x) / 2.
	row := (aSquarePoint y + anotherSquarePoint y) / 2.
	^ Point x: column y: row.</body>

<body package="Checkers" selector="whitePieces">whitePieces
	
	^ self pieces select: [:aPiece | aPiece isWhite].</body>
</methods>

<methods>
<class-id>CheckersBoard</class-id> <category>validation</category>

<body package="Checkers" selector="hasAPieceAt:">hasAPieceAt: aSquareNumber 
	^ [tableGrid includesKey: aSquareNumber]
	  on: KeyNotFoundError
	  do: [:anException | anException return false ].</body>

<body package="Checkers" selector="isPointOutOfTable:">isPointOutOfTable: aSquareNumber

	^ aSquareNumber &gt; 64 or: [ aSquareNumber &lt; 1]</body>
</methods>

<methods>
<class-id>CheckersBoard</class-id> <category>initialize-release</category>

<body package="Checkers" selector="columns">columns
	"Responde devolviendo la cantidad de casilleros que tiene el tablero a lo ancho"
	^columnAmount.</body>

<body package="Checkers" selector="initializeWithDimensions:by:">initializeWithDimensions: xSquaresAmount by: ySquaresAmount
	
	columnAmount := xSquaresAmount.
	rowAmount := ySquaresAmount.
	tableGrid := Dictionary new</body>

<body package="Checkers" selector="rows">rows
	"Responde devolviendo la cantidad de casilleros que tiene el tablero a lo largo"
	^rowAmount.</body>
</methods>

<methods>
<class-id>CheckersBoard</class-id> <category>piece-movement</category>

<body package="Checkers" selector="isEdge:">isEdge: aSquareNumber
	
	^aSquareNumber y = self rows or: [aSquareNumber y = 1]</body>

<body package="Checkers" selector="jumpForwardRight:">jumpForwardRight: aPiece
	"check if there's a rival piece on adjacent square"
	| piece positionToJump |
	positionToJump := ((self positionOf: aPiece) + 9 ).
	[ piece := self pieceAtSquare: positionToJump ]
	on: PieceNotFoundException
	do: [ :anException | (IllegalMovementException with: 'Está intentando saltar una casilla vacía') signal ].

	( (piece hasSameColorThan: aPiece))
		ifTrue: [ IllegalMovementException with: 'No puede saltar una ficha del mismo color' ]
		ifFalse: [ self move: aPiece to: ( positionToJump + 9 ).
					self freeSquareAt: positionToJump ]</body>

<body package="Checkers" selector="move:to:">move: aPiece to: aSquareNumber
	
	| originalPosition |
	originalPosition := self positionOf: aPiece.
	[self occupySquareAt: aSquareNumber with: aPiece]
		on: Exception
		do:
			[:anException | (IllegalMovementException with: 'movimiento inválido') signal].
	self freeSquareAt: originalPosition</body>
</methods>

<reorganize>
<class-id>CheckersBoard</class-id> <organization>('As yet unclassified' #blackPieces #diagonalDistance #diagonalDistanceBetween:and: #freeSquareAt: #hasLeftNeighbor: #hasLowerNeighbor: #hasRightNeighbor: #hasUpperNeighbor: #isNorthEdge: #numberOfSquares #occupySquareAt:with: #pieceAtSquare: #pieces #piecesBetween:and: #positionOf: #squareBetween:and: #whitePieces)
('validation' #hasAPieceAt: #isPointOutOfTable:)
('initialize-release' #columns #initializeWithDimensions:by: #rows)
('piece-movement' #isEdge: #jumpForwardRight: #move:to:)
</organization>
</reorganize>

<methods>
<class-id>CheckersBoard class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="rows:columns:">rows: rowsAmount columns: columnsAmount
	
	^(rowsAmount &lt; 0 or: [columnsAmount &lt; 0])
		ifTrue:
			[CanNotCreateTableException with:
					'can not create a table with negatives dimensions']
		ifFalse:
			[self new initializeWithDimensions: rowsAmount by: columnsAmount]</body>
</methods>

<class>
<name>IllegalMovementException</name>
<environment>Smalltalk</environment>
<super>Core.Error</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>description </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>IllegalMovementException</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>IllegalMovementException</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="initializeWithDescription:">initializeWithDescription: anErrorDescription
	description := anErrorDescription.
	</body>
</methods>

<methods>
<class-id>IllegalMovementException class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="with:">with: anErrorDescription
	^(self new initializeWithDescription: anErrorDescription) raiseSignal.</body>
</methods>

<class>
<name>InvalidTurnException</name>
<environment>Smalltalk</environment>
<super>Core.Error</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>description </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>InvalidTurnException class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="with:">with: anErrorDescription
	
	^(self new initializeWithDescription: anErrorDescription) raiseSignal</body>
</methods>

<class>
<name>NormalRole</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>piece </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>NormalRole</class-id> <category>initialize-release</category>

<body package="Checkers" selector="checkersBoard">checkersBoard
	
	^piece checkersBoard</body>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Checkers" selector="initializeFor:">initializeFor: aPiece
	
	piece := aPiece</body>

<body package="Checkers" selector="moveTo:">moveTo: aSquarePoint
	
	| actualPosition movement rules board |
	board := self checkersBoard.
	actualPosition := board positionOf: piece.	"movement := Movement madeBy: aNormalPiece to: aSquarePoint in:
			aCheckersBoard."
	rules := NormalRules getUniqueInstance.	"rules validate: movement for: aNormalPiece."
	board move: piece to: aSquarePoint</body>
</methods>

<methods>
<class-id>NormalRole</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="crown:">crown: aCheckersPiece 
	aCheckersPiece crown.</body>

<body package="Checkers" selector="isQueen">isQueen
	^ false.</body>

<body package="Checkers" selector="jumpTo:">jumpTo: aPoint
	
	| movement rules aCheckersBoard |
	aCheckersBoard := piece checkersBoard.
	movement := JumpMovement madeBy: piece to: aPoint in: aCheckersBoard.
	rules := NormalRules getUniqueInstance.	"	rules validate: movement for: aNormalPiece."
	aCheckersBoard move: piece to: aPoint.
	aCheckersBoard freeSquareAt: movement over</body>
</methods>

<reorganize>
<class-id>NormalRole</class-id> <organization>('initialize-release' #checkersBoard #initialize #initializeFor: #moveTo:)
('movement')
('As yet unclassified' #crown: #isQueen #jumpTo:)
</organization>
</reorganize>

<methods>
<class-id>NormalRole class</class-id> <category>instance creation</category>

<body package="Checkers" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<methods>
<class-id>NormalRole class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="for:">for: aPiece
	
	^self new initializeFor: aPiece</body>
</methods>

<class>
<name>CanNotCreateTableException</name>
<environment>Smalltalk</environment>
<super>Core.Error</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>description </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>CanNotCreateTableException</class-id> <category>initialize-release</category>

<body package="Checkers" selector="getDescription">getDescription
	^description.</body>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Checkers" selector="initializeWithDescription:">initializeWithDescription: anErrorDescription
	description := anErrorDescription.</body>
</methods>

<class>
<name>CheckersPiece</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>color pieceRole checkersBoard </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>CheckersPiece</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="checkersBoard">checkersBoard
	
	^checkersBoard</body>

<body package="Checkers" selector="color">color
	^color</body>

<body package="Checkers" selector="crown">crown
	
	pieceRole := QueenRole for: self</body>

<body package="Checkers" selector="hasSameColorThan:">hasSameColorThan: anotherPiece
	^ self color = anotherPiece color</body>

<body package="Checkers" selector="isBlack">isBlack
	^ color = 'black'.</body>

<body package="Checkers" selector="isCrowned">isCrowned
	
	^pieceRole isQueen</body>

<body package="Checkers" selector="isWhite">isWhite
	^ color = 'white'.</body>

<body package="Checkers" selector="jumpTo:">jumpTo: aPoint
	
	^pieceRole jumpTo: aPoint</body>

<body package="Checkers" selector="tryToCrown">tryToCrown
	^(checkersBoard isNorthEdge: (checkersBoard positionOf: self)) ifTrue: [ color = 'black' ifTrue: [pieceRole crown: self]].</body>
</methods>

<methods>
<class-id>CheckersPiece</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Checkers" selector="initializeWithColor:andRole:">initializeWithColor: aColorName andRole: aRole
	
	color := aColorName.
	pieceRole := aRole</body>

<body package="Checkers" selector="initializeWithColor:in:">initializeWithColor: aColorName in: aCheckersBoard
	
	color := aColorName.
	pieceRole := NormalRole for: self.
	checkersBoard := aCheckersBoard</body>
</methods>

<methods>
<class-id>CheckersPiece</class-id> <category>movement</category>

<body package="Checkers" selector="moveTo:">moveTo: aPositionInBoard
	
	^pieceRole moveTo: aPositionInBoard</body>
</methods>

<reorganize>
<class-id>CheckersPiece</class-id> <organization>('As yet unclassified' #checkersBoard #color #crown #hasSameColorThan: #isBlack #isCrowned #isWhite #jumpTo: #tryToCrown)
('initialize-release' #initialize #initializeWithColor:andRole: #initializeWithColor:in:)
('movement' #moveTo:)
</organization>
</reorganize>

<methods>
<class-id>CheckersPiece class</class-id> <category>instance creation</category>

<body package="Checkers" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<methods>
<class-id>CheckersPiece class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="newBlackIn:">newBlackIn: aCheckersBoard
	
	^self new initializeWithColor: 'black' in: aCheckersBoard</body>

<body package="Checkers" selector="newBlackWithRole:">newBlackWithRole: aRole
	^self new initializeWithColor: 'black' andRole: aRole.</body>

<body package="Checkers" selector="newWhiteIn:">newWhiteIn: aCheckersBoard
	
	^self new initializeWithColor: 'white' in: aCheckersBoard</body>

<body package="Checkers" selector="newWhiteWithRole:">newWhiteWithRole: aRole
	^self new initializeWithColor: 'white' andRole: aRole.</body>
</methods>

<class>
<name>QueenRole</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>piece </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>QueenRole</class-id> <category>initialize-release</category>

<body package="Checkers" selector="checkersBoard">checkersBoard
	
	^piece checkersBoard</body>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Checkers" selector="initializeFor:">initializeFor: aPiece
	
	piece := aPiece</body>

<body package="Checkers" selector="isQueen">isQueen
	
	^true</body>

<body package="Checkers" selector="moveTo:">moveTo: aSquarePoint
	
	| actualPosition movement rules board |
	board := self checkersBoard.
	actualPosition := board positionOf: piece.	"movement := Movement madeBy: aNormalPiece to: aSquarePoint in:
			aCheckersBoard."
	rules := QueenRules getUniqueInstance.	"rules validate: movement for: aNormalPiece."
	board move: piece to: aSquarePoint</body>
</methods>

<methods>
<class-id>QueenRole</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="crown:">crown: aCheckersPiece 
	"no hago nada"</body>
</methods>

<methods>
<class-id>QueenRole class</class-id> <category>instance creation</category>

<body package="Checkers" selector="for:">for: aPiece
	
	^self new initializeFor: aPiece</body>

<body package="Checkers" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<class>
<name>Rules</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars>uniqueInstance </class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>Rules</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>Rules</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="validate:for:">validate: aMovement for: aCheckersPiece 
	| aBoard actualPosition equalFormPosition isSquareEmpty isLegalSquareNumber isCorrectDistance |
	aBoard := aMovement in.
	actualPosition := aBoard positionOf: aCheckersPiece.
	equalFormPosition := aMovement from = actualPosition.
	isSquareEmpty := (aBoard hasAPieceAt: aMovement to) not.
	isLegalSquareNumber := aCheckersPiece isCrowned 
		ifFalse: [ aCheckersPiece isBlack 
				 ifTrue: [  actualPosition &lt; aMovement to ]
				ifFalse: [ actualPosition &gt; aMovement to] ].
	isCorrectDistance :=  aCheckersPiece isCrowned 
		ifTrue: [aMovement diagonalDistance &gt;= 1]
		ifFalse: [aMovement diagonalDistance = 1].
	^ equalFormPosition and: [ isSquareEmpty and: [ isLegalSquareNumber and: [isCorrectDistance and: [ aMovement isDiagonal] ] ] ]</body>
</methods>

<class>
<name>NormalRules</name>
<environment>Smalltalk</environment>
<super>Rules</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>NormalRules</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Checkers" selector="validate:for:">validate: aMovement for: aCheckersPiece
	
	self validateDirection: aMovement.
	self validateDistance: aMovement.
</body>
</methods>

<methods>
<class-id>NormalRules</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="validateDirection:">validateDirection: aMovement 
	
	| validMovement |
	(aMovement piece isBlack)
		ifTrue: [   validMovement := (aMovement from y &lt; aMovement to y ) ]
		ifFalse: [ validMovement := (aMovement from y &gt; aMovement to y) ].
	validMovement 
		ifFalse: [ IllegalMovementException with: 'Direccion de movimiento no permitida para ', (aMovement piece printString)]
	</body>

<body package="Checkers" selector="validateDistance:">validateDistance: aMovement
	
	| distance |
	distance := aMovement diagonalDistance.
	(aMovement isJump)
		ifTrue:
			[distance = 2
				ifFalse:
					[IllegalMovementException with:
							'Una pieza normal no se puede saltar mas de un casillero']]
		ifFalse:
			[distance = 1
				ifFalse:
					[IllegalMovementException with:
							'Una pieza normal no se puede mover mas de un casillero']]</body>
</methods>

<class>
<name>Player</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>name color </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>Player</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>Player</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="initializeNamed:">initializeNamed: aName 
	name:= aName.</body>

<body package="Checkers" selector="initializeNamed:color:">initializeNamed: aName color: aColorSide
	
	name := aName.
	color := aColorSide</body>

<body package="Checkers" selector="isBlack">isBlack
	^ color = 'black'</body>

<body package="Checkers" selector="isBlackPlayer">isBlackPlayer
	
	^color = 'black'</body>

<body package="Checkers" selector="jump:to:in:">jump: aCheckersPiece to: aSquarePoint in: aCheckersBoard
	
	^JumpMovement madeBy: aCheckersPiece to: aSquarePoint in: aCheckersBoard</body>

<body package="Checkers" selector="makeMoveIn:">makeMoveIn: aCheckersGame
	
	| pieces allPossibleMoves |
	pieces := aCheckersGame piecesFor: self.
	allPossibleMoves := Set new.
	pieces
		collect:
			[:aPiece | allPossibleMoves addAll: (aCheckersGame rules getMovesFor: aPiece)].
	^allPossibleMoves any</body>

<body package="Checkers" selector="move:to:in:">move: aCheckersPiece to: aSquareNumber in: aCheckersBoard
	
	^Movement madeBy: aCheckersPiece to: aSquareNumber in: aCheckersBoard</body>

<body package="Checkers" selector="name">name
	^ name.</body>

<body package="Checkers" selector="whitePlayer">whitePlayer
	
	^color = 'white'</body>
</methods>

<methods>
<class-id>Player class</class-id> <category>instance creation</category>

<body package="Checkers" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<methods>
<class-id>Player class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="blackNamed:">blackNamed: aName
	
	^self named: aName color: 'black'</body>

<body package="Checkers" selector="named:">named: aName 
	^ self new initializeNamed: aName.</body>

<body package="Checkers" selector="named:color:">named: aName color: aColorSide
	
	^self new initializeNamed: aName color: aColorSide</body>

<body package="Checkers" selector="whiteNamed:">whiteNamed: aName
	
	^self named: aName color: 'white'</body>
</methods>

<class>
<name>PieceNotFoundException</name>
<environment>Smalltalk</environment>
<super>Core.Error</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>description </inst-vars>
<class-inst-vars>description </class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>PieceNotFoundException</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Checkers" selector="initializeWithDescription:">initializeWithDescription: anErrorDescription
	description := anErrorDescription</body>
</methods>

<methods>
<class-id>JumpMovement class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="madeBy:to:in:">madeBy: aCheckersPiece to: aPointInBoard in: aCheckersBoard
	
	^self new initializeMovementMadeBy: aCheckersPiece to: aPointInBoard in:
			aCheckersBoard</body>
</methods>

<methods>
<class-id>PieceNotFoundException class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="with:">with: anErrorDescription
	
	^(self  new initializeWithDescription: anErrorDescription) raiseSignal
</body>
</methods>

<methods>
<class-id>CanNotCreateTableException class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="with:">with: anErrorDescription
	
	^(self new initializeWithDescription: anErrorDescription) raiseSignal.</body>
</methods>

<methods>
<class-id>Rules class</class-id> <category>instance creation</category>

<body package="Checkers" selector="new">new
	"Answer a newly created and initialized instance."
	
	^uniqueInstance := self basicNew</body>
</methods>

<methods>
<class-id>Rules class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="getUniqueInstance">getUniqueInstance
	
	uniqueInstance isNil ifTrue: [self new].
	^uniqueInstance</body>
</methods>

<class>
<name>QueenRules</name>
<environment>Smalltalk</environment>
<super>Rules</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>QueenRules</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>


</st-source>
