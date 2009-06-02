<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.5 of April 16, 2007 on May 31, 2009 at 4:25:22 pm</time-stamp>
<!-- Package Changes for Checkers* -->


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
<name>CheckersPiece</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>color crowned </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>CheckersPiece</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>CheckersPiece</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="crown">crown
	crowned := true.</body>

<body package="Checkers" selector="initializeBlack">initializeBlack
	color := 'black'.
	crowned := false.</body>

<body package="Checkers" selector="initializeWhite">initializeWhite
	color := 'white'.
	crowned := false.</body>

<body package="Checkers" selector="isBlack">isBlack
	^ color = 'black'.</body>

<body package="Checkers" selector="isCrowned">isCrowned
	^ crowned.</body>

<body package="Checkers" selector="isWhite">isWhite
	^ color = 'white'.</body>

<body package="Checkers" selector="moveTo:in:">moveTo: aPoint in: aTable 
	| positionBeforeMove |
	positionBeforeMove := (self positionInTable: aTable).
	aTable
		occupySquareAt: aPoint with: self;
		freeSquareAt: positionBeforeMove.
</body>

<body package="Checkers" selector="positionInTable:">positionInTable: aTable 
	^aTable positionOf: self</body>
</methods>

<methods>
<class-id>CheckersPiece class</class-id> <category>instance creation</category>

<body package="Checkers" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<methods>
<class-id>CheckersPiece class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="newBlack">newBlack
	^super new initializeBlack.</body>

<body package="Checkers" selector="newWhite">newWhite
	^super new initializeWhite.</body>
</methods>

<class>
<name>CheckersGame</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>aCheckersTable </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>My Classes</category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>CheckersGame</class-id> <category>initialize-release</category>

<body package="Checkers" selector="blackPiecesInGame">blackPiecesInGame
	^ aCheckersTable blackPieces size.</body>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Checkers" selector="initializeWithBasicConfiguration">initializeWithBasicConfiguration
	| piecesCreated blackPieces whitePieces piecePosition |

	blackPieces := List new: 12.
	whitePieces := List new: 12.
	piecePosition := 1.
	aCheckersTable :=CheckersTable withDimensions: 8 by: 8.
	piecesCreated := 0.
	[ piecesCreated &lt; 12 ] whileTrue: [ piecesCreated := piecesCreated + 1. 
									   blackPieces add: CheckersPiece newBlack.
									   whitePieces add: CheckersPiece newWhite].

	blackPieces do: [:aPiece | aCheckersTable occupySquareAt: piecePosition with: aPiece. 
							  piecePosition := piecePosition + 1 ].
	
	piecePosition := 21.
	whitePieces do: [:aPiece | aCheckersTable occupySquareAt: piecePosition with: aPiece. 
							  piecePosition := piecePosition + 1 ].</body>

<body package="Checkers" selector="initializeWithJumpConfiguration">initializeWithJumpConfiguration
	aCheckersTable :=CheckersTable withDimensions: 8 by: 8.
	
	aCheckersTable
					occupySquareAt: 1 with: CheckersPiece newBlack;
					occupySquareAt: 6 with: CheckersPiece newWhite;
					occupySquareAt: 14 with: CheckersPiece newBlack;
					occupySquareAt: 18 with: CheckersPiece newWhite.</body>

<body package="Checkers" selector="whitePiecesInGame">whitePiecesInGame
	^ aCheckersTable whitePieces size.</body>
</methods>

<methods>
<class-id>CheckersGame</class-id> <category>accessing</category>

<body package="Checkers" selector="checkersTable">checkersTable
	 ^ aCheckersTable</body>
</methods>

<reorganize>
<class-id>CheckersGame</class-id> <organization>('initialize-release' #blackPiecesInGame #initialize #initializeWithBasicConfiguration #initializeWithJumpConfiguration #whitePiecesInGame)
('accessing' #checkersTable)
</organization>
</reorganize>

<methods>
<class-id>CheckersGame class</class-id> <category>instance creation</category>

<body package="Checkers" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="Checkers" selector="withInitialConfiguration">withInitialConfiguration
	^ self new initializeWithBasicConfiguration</body>

<body package="Checkers" selector="withJumpConfiguration">withJumpConfiguration
	^ self new initializeWithJumpConfiguration</body>
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

<methods>
<class-id>CanNotCreateTableException class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="with:">with: anErrorDescription
	
	^(self new initializeWithDescription: anErrorDescription) raiseSignal.</body>
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
<class-id>PieceNotFoundException class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="with:">with: anErrorDescription
	
	^(self  new initializeWithDescription: anErrorDescription) raiseSignal
</body>
</methods>

<class>
<name>CheckersTable</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>xDimension yDimension tableGrid </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>CheckersTable</class-id> <category>initialize-release</category>

<body package="Checkers" selector="xNumberOfSquares">xNumberOfSquares
	"Responde devolviendo la cantidad de casilleros que tiene el tablero a lo ancho"
	^xDimension.</body>

<body package="Checkers" selector="yNumberOfSquares">yNumberOfSquares
	"Responde devolviendo la cantidad de casilleros que tiene el tablero a lo largo"
	^yDimension.</body>
</methods>

<methods>
<class-id>CheckersTable</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="blackPieces">blackPieces
	
	^ self pieces select: [:aPiece | aPiece isBlack].</body>

<body package="Checkers" selector="freeSquareAt:">freeSquareAt: aSquareNumber 
	tableGrid removeKey: aSquareNumber</body>

<body package="Checkers" selector="hasAPieceAt:">hasAPieceAt: aSquareNumber 
	^ [tableGrid includesKey: aSquareNumber]
	  on: KeyNotFoundError
	  do: [:anException | anException return false ].</body>

<body package="Checkers" selector="initializeWithDimensions:by:">initializeWithDimensions: xSquaresAmount by: ySquaresAmount
	xDimension := xSquaresAmount.
	yDimension := ySquaresAmount.
	tableGrid := Dictionary new.</body>

<body package="Checkers" selector="isPointOutOfTable:">isPointOutOfTable: aSquareNumber

	^ aSquareNumber &gt; 32 or: [ aSquareNumber &lt; 1]</body>

<body package="Checkers" selector="jumpPieceFrom:over:">jumpPieceFrom: aSquare over: anotherSquare</body>

<body package="Checkers" selector="movePieceFrom:to:">movePieceFrom: aSquareNumber to: anotherSquareNumber
	| positionBeforeMove pieceToMove |
	pieceToMove := self pieceAtSqueare: aSquareNumber.
	positionBeforeMove := pieceToMove positionInTable: self.
	self
		occupySquareAt: anotherSquareNumber with: pieceToMove;
		freeSquareAt: positionBeforeMove.</body>

<body package="Checkers" selector="numberOfSquares">numberOfSquares
	^ xDimension * yDimension.</body>

<body package="Checkers" selector="occupySquareAt:with:">occupySquareAt: aSqueareNumber with: aPiece

	( self isPointOutOfTable: aSqueareNumber )
		ifTrue: [ PositionOutOfTableException with: 'No se puede realizar un movimiento fuera del tablero ' ].
	
	( self hasAPieceAt: aSqueareNumber)
		ifTrue: [ IllegalMovementException with: 'No se puede realizar un movimiento hacia una casilla ocupada '  ]
		ifFalse: [ ^tableGrid at: aSqueareNumber put: aPiece ]</body>

<body package="Checkers" selector="pieceAtSqueare:">pieceAtSqueare: aSquareNumber

	^ [ tableGrid at: aSquareNumber ]
	   on: KeyNotFoundError
	   do: [:anException |  PieceNotFoundException with: ' No existe una pieza en la posicion ' , aSquareNumber ]</body>

<body package="Checkers" selector="pieces">pieces
	^ tableGrid values.</body>

<body package="Checkers" selector="positionOf:">positionOf: aCheckersPiece 
	^[ tableGrid keyAtValue: aCheckersPiece ]
	 on: ValueNotFoundError 
	 do: [ :anException | (PieceNotFoundException with: 'No existe la pieza en el tablero') ]</body>

<body package="Checkers" selector="whitePieces">whitePieces
	
	^ self pieces select: [:aPiece | aPiece isWhite].</body>
</methods>

<methods>
<class-id>CheckersTable class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="withDimensions:by:">withDimensions: xBoxesAmount by: yBoxesAmount
	  ^(xBoxesAmount &lt; 0 or: [yBoxesAmount &lt; 0] )
		ifTrue: [ CanNotCreateTableException with: 'can not create a table with negatives dimensions']
		ifFalse: [ self new initializeWithDimensions: xBoxesAmount by: yBoxesAmount]</body>
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


</st-source>
