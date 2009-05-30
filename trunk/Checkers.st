<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on May 30, 2009 at 12:08:56 pm</time-stamp>
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
<name>CheckersPiece</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>color </inst-vars>
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

<body package="Checkers" selector="initializeBlack">initializeBlack
	color := 'black'</body>

<body package="Checkers" selector="initializeWhite">initializeWhite
	color := 'white'.</body>

<body package="Checkers" selector="isBlack">isBlack
	^ color = 'black'.</body>

<body package="Checkers" selector="isCrowned">isCrowned
	^ false.</body>

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
<name>Table</name>
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
<class-id>Table</class-id> <category>initialize-release</category>

<body package="Checkers" selector="xNumberOfBoxes">xNumberOfBoxes
	"Responde devolviendo la cantidad de casilleros que tiene el tablero a lo ancho"
	^xDimension.</body>

<body package="Checkers" selector="yNumberOfBoxes">yNumberOfBoxes
	"Responde devolviendo la cantidad de casilleros que tiene el tablero a lo largo"
	^yDimension.</body>
</methods>

<methods>
<class-id>Table</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="freeSquareAt:">freeSquareAt: aPoint 
	tableGrid removeKey: aPoint</body>

<body package="Checkers" selector="hasAPieceAt:">hasAPieceAt: aPoint 
	^ [tableGrid includesKey: aPoint]
	  on: KeyNotFoundError
	  do: [:anException | anException return false ].</body>

<body package="Checkers" selector="initializeWithDimensions:by:">initializeWithDimensions: xSquaresAmount by: ySquaresAmount
	xDimension := xSquaresAmount.
	yDimension := ySquaresAmount.
	tableGrid := Dictionary new.</body>

<body package="Checkers" selector="isPointOutOfTable:">isPointOutOfTable: aPoint
	| isXOutOFRange isYOutOFRange |	

	isXOutOFRange :=  ( aPoint x &lt;= 0 or: [ aPoint x &gt; xDimension ] ) .
	isYOutOFRange :=  ( aPoint y &lt;= 0  or: [ aPoint y &gt; yDimension ] ).
	^ isXOutOFRange or: [ isYOutOFRange ]</body>

<body package="Checkers" selector="numberOfSquares">numberOfSquares
	^ xDimension * yDimension.</body>

<body package="Checkers" selector="occupySquareAt:with:">occupySquareAt: aPoint with: aPiece

	( self isPointOutOfTable: aPoint )
		ifTrue: [ PositionOutOfTableException with: 'No se puede realizar un movimiento fuera del tablero ' ].
	
	( self hasAPieceAt: aPoint)
		ifTrue: [ IllegalMovementException with: 'No se puede realizar un movimiento hacia una casilla ocupada '  ]
		ifFalse: [ ^tableGrid at: aPoint put: aPiece ]</body>

<body package="Checkers" selector="pieces">pieces
	^ tableGrid values.</body>

<body package="Checkers" selector="positionOf:">positionOf: aCheckersPiece 
	^[ tableGrid keyAtValue: aCheckersPiece ]
	 on: ValueNotFoundError 
	 do: [ :anException | (PieceNotFoundException with: 'No existe la pieza en el tablero') ]</body>

<body package="Checkers" selector="whitePieces">whitePieces
	
	^ self pieces select: [:aPiece | aPiece isWhite].</body>
</methods>

<remove-selector>
<class-id>Table</class-id> <selector>initialize</selector>
</remove-selector>

<methods>
<class-id>Table class</class-id> <category>As yet unclassified</category>

<body package="Checkers" selector="withDimensions:by:">withDimensions: xBoxesAmount by: yBoxesAmount
	  ^(xBoxesAmount &lt; 0 or: [yBoxesAmount &lt; 0] )
		ifTrue: [ CanNotCreateTableException with: 'can not create a table with negatives dimensions']
		ifFalse: [ self new initializeWithDimensions: xBoxesAmount by: yBoxesAmount]</body>
</methods>

<remove-selector>
<class-id>Table class</class-id> <selector>new</selector>
</remove-selector>

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


</st-source>
