<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on June 9, 2009 at 3:42:43 pm</time-stamp>
<!-- Package Changes for Checkers* -->


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

<class>
<name>NormalRules</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
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

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<class>
<name>CheckersPiece</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>color crowned pieceRole checkersTable aPieceRole </inst-vars>
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

<body package="Checkers" selector="checkersBoard">checkersBoard
	^ checkersTable</body>

<body package="Checkers" selector="crown">crown
	crowned := true.</body>

<body package="Checkers" selector="initializeWithColor:in:">initializeWithColor: aColorName in: aCheckersTable
	color := 'aColorName'.
	crowned := false.
	pieceRole := NormalRole for: self.
	checkersTable := aCheckersTable</body>

<body package="Checkers" selector="isBlack">isBlack
	^ color = 'black'.</body>

<body package="Checkers" selector="isCrowned">isCrowned
	^ crowned.</body>

<body package="Checkers" selector="isWhite">isWhite
	^ color = 'white'.</body>

<body package="Checkers" selector="moveForwardLeftBy:">moveForwardLeftBy: aSquareNumber 
	pieceRole moveToFowardLeftBy: aSquareNumber</body>

<body package="Checkers" selector="moveTo:">moveTo: aPositionInBoard
	
	^pieceRole moveTo: aPositionInBoard</body>

<body package="Checkers" selector="moveToBackLeftBy:">moveToBackLeftBy: aSquareAmount 
	pieceRole moveToBackLeftBy: aSquareAmount</body>

<body package="Checkers" selector="moveToFowardRightBy:">moveToFowardRightBy: aSquareAmount 
	pieceRole moveToFowardRightBy: aSquareAmount</body>
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
<class-id>CheckersPiece class</class-id> <category>instance creation</category>

<body package="Checkers" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<methods>
<class-id>CheckersPiece class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="newBlackIn:">newBlackIn: aCheckersTable
	^super new initializeWithColor: 'black' in: aCheckersTable.</body>

<body package="Checkers" selector="newWhiteIn:">newWhiteIn: aCheckersTable
	^super new initializeWithColor: 'black' in: aCheckersTable.</body>
</methods>

<methods>
<class-id>CanNotCreateTableException class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="with:">with: anErrorDescription
	
	^(self new initializeWithDescription: anErrorDescription) raiseSignal.</body>
</methods>

<class>
<name>CheckersBoard</name>
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
<class-id>CheckersBoard</class-id> <category>initialize-release</category>

<body package="Checkers" selector="xNumberOfSquares">xNumberOfSquares
	"Responde devolviendo la cantidad de casilleros que tiene el tablero a lo ancho"
	^xDimension.</body>

<body package="Checkers" selector="yNumberOfSquares">yNumberOfSquares
	"Responde devolviendo la cantidad de casilleros que tiene el tablero a lo largo"
	^yDimension.</body>
</methods>

<methods>
<class-id>CheckersBoard</class-id> <category>As yet unclassified</category>

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

	^ aSquareNumber &gt; 64 or: [ aSquareNumber &lt; 1]</body>

<body package="Checkers" selector="makeMoveFor:ForwardRightBy:">makeMoveFor: aCheckersPiece ForwardRightBy: aSquareAmount 
	| actualPosition nextPosition piecesBetween |
	actualPosition := self positionOf: aCheckersPiece.
	nextPosition := actualPosition + (aSquareAmount * 9 ).
	( self hasAPieceAt: nextPosition )
		ifTrue: [ IllegalMovementException with: '....' ]
		ifFalse: [ self freeSquareAt: actualPosition.
				 self occupySquareAt: nextPosition with: aCheckersPiece.
				 piecesBetween := self piecesBetween: actualPosition and: nextPosition.
				 ( piecesBetween size = 1 )
					ifTrue: [ self freeSquareAt: ( self positionOf: ( piecesBetween any ) )] ]</body>

<body package="Checkers" selector="makeMoveFor:FowardLeftBy:">makeMoveFor: aCheckersPiece FowardLeftBy: aSquareAmount
	</body>

<body package="Checkers" selector="makeMoveFor:LeftRightBy:">makeMoveFor: aCheckersPiece LeftRightBy: aSquareAmount 
		| actualPosition nextPosition piecesBetween |

	actualPosition := self positionOf: aCheckersPiece.
	nextPosition := actualPosition + (aSquareAmount * 7 ).
	( self hasAPieceAt: nextPosition )
		ifTrue: [ IllegalMovementException with: '....' ]
		ifFalse: [ self freeSquareAt: actualPosition.
				 self occupySquareAt: nextPosition with: aCheckersPiece.
				 piecesBetween := self piecesBetween: actualPosition and: nextPosition.
				 ( piecesBetween size = 1 )
					ifTrue: [ self freeSquareAt: ( self positionOf: ( piecesBetween any ) )] ]</body>

<body package="Checkers" selector="numberOfSquares">numberOfSquares
	^ xDimension * yDimension.</body>

<body package="Checkers" selector="occupySquareAt:with:">occupySquareAt: aSqueareNumber with: aPiece

	( self isPointOutOfTable: aSqueareNumber )
		ifTrue: [ PositionOutOfTableException with: 'No se puede realizar un movimiento fuera del tablero ' ].
	
	( self hasAPieceAt: aSqueareNumber)
		ifTrue: [ IllegalMovementException with: 'No se puede realizar un movimiento hacia una casilla ocupada '  ]
		ifFalse: [ ^tableGrid at: aSqueareNumber put: aPiece ]</body>

<body package="Checkers" selector="pieceAtSquare:">pieceAtSquare: aSquareNumber

	^ [ tableGrid at: aSquareNumber ]
	   on: KeyNotFoundError
	   do: [:anException |  PieceNotFoundException with: ' No existe una pieza en la posicion ' , aSquareNumber ]</body>

<body package="Checkers" selector="pieces">pieces
	^ tableGrid values.</body>

<body package="Checkers" selector="piecesBetween:and:">piecesBetween: aSquareNumber and: anotherSquareNumber
	| i pieces |
	i := 1.
	pieces := List new.
	[ aSquareNumber + (i*9) &lt; anotherSquareNumber ] whileTrue: 
	[ (self hasAPieceAt: aSquareNumber + (i*9)) ifTrue: 
		[ pieces add: (self pieceAtSquare: aSquareNumber + (i*9)) ].
	  i := i + 1 ].
	^ pieces.</body>

<body package="Checkers" selector="positionOf:">positionOf: aCheckersPiece 
	^[ tableGrid keyAtValue: aCheckersPiece ]
	 on: ValueNotFoundError 
	 do: [ :anException | (PieceNotFoundException with: 'No existe la pieza en el tablero') ]</body>

<body package="Checkers" selector="whitePieces">whitePieces
	
	^ self pieces select: [:aPiece | aPiece isWhite].</body>
</methods>

<methods>
<class-id>CheckersBoard class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="rows:columns:">rows: xBoxesAmount columns: yBoxesAmount
	  ^( xBoxesAmount &lt; 0 or: [yBoxesAmount &lt; 0]  )
		ifTrue: [ CanNotCreateTableException with: 'can not create a table with negatives dimensions']
		ifFalse: [ self new initializeWithDimensions: xBoxesAmount by: yBoxesAmount]</body>
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

<methods>
<class-id>PieceNotFoundException class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="with:">with: anErrorDescription
	
	^(self  new initializeWithDescription: anErrorDescription) raiseSignal
</body>
</methods>

<methods>
<class-id>NormalRules class</class-id> <category>instance creation</category>

<body package="Checkers" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<methods>
<class-id>NormalRules class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="validateMovementFor:to:">validateMovementFor: aCheckersPiece to: aSmallInteger 
	self halt</body>
</methods>

<class>
<name>NormalRole</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>aPiece aCheckersBoard </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Checkers</package>
</attributes>
</class>

<methods>
<class-id>NormalRole</class-id> <category>initialize-release</category>

<body package="Checkers" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Checkers" selector="initializeFor:">initializeFor: aCheckersPiece
	aPiece := aCheckersPiece</body>

<body package="Checkers" selector="moveTo:">moveTo: aSquareAmount
	
	NormalRules validateMovementFor: aPiece to: aSquareAmount.
	aCheckersBoard makeMoveFor: aPiece to: aSquareAmount.
	</body>
</methods>

<methods>
<class-id>NormalRole</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="moveToBackLeftBy:">moveToBackLeftBy: aSmallInteger 
	IllegalMovementException with: 'Esta pieza no puede moverse hacia atras'</body>

<body package="Checkers" selector="moveToFowardLeftBy:">moveToFowardLeftBy: aSquareAmount 
	aSquareAmount &gt; 2
	ifTrue: [ IllegalMovementException with: ' MovimientoProhibido para una pieza normal' ]
	ifFalse: [ aPiece checkersBoard makeMoveFor: aPiece LeftRightBy: aSquareAmount ]</body>

<body package="Checkers" selector="moveToFowardRightBy:">moveToFowardRightBy: aSquareAmount
	aSquareAmount &gt; 2
		ifTrue: [ IllegalMovementException with: ' MovimientoProhibido para una pieza normal' ]
		ifFalse: [ aPiece checkersBoard makeMoveFor: aPiece ForwardRightBy: aSquareAmount ]


</body>
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
	aCheckersTable := CheckersBoard rows: 8 columns: 8.
	piecesCreated := 0.
	[ piecesCreated &lt; 12 ] whileTrue: [ piecesCreated := piecesCreated + 1. 
									   blackPieces add: ( CheckersPiece newBlackIn: aCheckersTable ).
									   whitePieces add: ( CheckersPiece newWhiteIn: aCheckersTable )].

	blackPieces do: [:aPiece | aCheckersTable occupySquareAt: piecePosition with: aPiece. 
							  piecePosition := piecePosition + 2 ].
	
	piecePosition := 40.
	whitePieces do: [:aPiece | aCheckersTable occupySquareAt: piecePosition with: aPiece. 
							  piecePosition := piecePosition + 2 ].</body>

<body package="Checkers" selector="initializeWithJumpConfiguration">initializeWithJumpConfiguration
	aCheckersTable :=CheckersBoard rows: 8 columns: 8.
	
	aCheckersTable
					occupySquareAt: 1 with: ( CheckersPiece newBlackIn: aCheckersTable );
					occupySquareAt: 10 with: ( CheckersPiece newWhiteIn: aCheckersTable );
					occupySquareAt: 3 with: ( CheckersPiece newBlackIn: aCheckersTable );
					occupySquareAt: 12 with: ( CheckersPiece newWhiteIn: aCheckersTable );
					occupySquareAt: 30 with: ( CheckersPiece newWhiteIn: aCheckersTable )</body>

<body package="Checkers" selector="whitePiecesInGame">whitePiecesInGame
	^ aCheckersTable whitePieces size.</body>
</methods>

<methods>
<class-id>CheckersGame</class-id> <category>accessing</category>

<body package="Checkers" selector="checkersBoard">checkersBoard
	 ^ aCheckersTable</body>
</methods>

<reorganize>
<class-id>CheckersGame</class-id> <organization>('initialize-release' #blackPiecesInGame #initialize #initializeWithBasicConfiguration #initializeWithJumpConfiguration #whitePiecesInGame)
('accessing' #checkersBoard)
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

<body package="Checkers" selector="for:">for: aCheckersPiece 
	^ self new initializeFor: aCheckersPiece</body>
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
<class-id>CheckersGame class</class-id> <category>instance creation</category>

<body package="Checkers" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="Checkers" selector="withInitialConfiguration">withInitialConfiguration
	^ self new initializeWithBasicConfiguration</body>

<body package="Checkers" selector="withJumpConfiguration">withJumpConfiguration
	^ self new initializeWithJumpConfiguration</body>
</methods>

<methods>
<class-id>IllegalMovementException class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="with:">with: anErrorDescription
	^(self new initializeWithDescription: anErrorDescription) raiseSignal.</body>
</methods>


</st-source>
