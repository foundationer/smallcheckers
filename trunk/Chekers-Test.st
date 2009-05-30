<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on May 30, 2009 at 12:09:02 pm</time-stamp>
<!-- Package Changes for Chekers-Test* -->


<class>
<name>TableTest</name>
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
<class-id>TableTest</class-id> <category>initialize-release</category>

<body package="Chekers-Test" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Chekers-Test" selector="testFreeABox">testFreeABox

	| checkersTable piece tablePoint |
	checkersTable := Table withDimensions: 8 by: 8.
	piece := CheckersPiece new.
	tablePoint := Point x: 1 y: 2.
	checkersTable occupySquareAt: tablePoint with: piece.
	checkersTable freeSquareAt: tablePoint.
	self deny: ( checkersTable hasAPieceAt: tablePoint)
	</body>

<body package="Chekers-Test" selector="testNumberOfBoxForATable">testNumberOfBoxForATable

| damasTable |
	damasTable := Table withDimensions: 8 by: 8.
	self assert: damasTable xNumberOfBoxes = 8.
 	self assert: damasTable yNumberOfBoxes = 8.</body>

<body package="Chekers-Test" selector="testOcuppyASquare">testOcuppyASquare

	| damasTable  aPiece aDefinedTablePoint aNotDefinedTablePoint |

	damasTable := Table withDimensions: 8 by: 8.
	aDefinedTablePoint := Point x: 1 y: 1.
	aNotDefinedTablePoint := Point x: 2 y: 1.
	aPiece := 'somePiece'.
	damasTable occupySquareAt: aDefinedTablePoint with: aPiece.
	self assert: (damasTable hasAPieceAt: aDefinedTablePoint).
	self deny: (damasTable hasAPieceAt: aNotDefinedTablePoint).</body>

<body package="Chekers-Test" selector="testOcuppyBoxInARange">testOcuppyBoxInARange
	
	| damasTable  aPiece aDefinedTablePoint |
	
	damasTable := Table withDimensions: 8 by: 8.
	aDefinedTablePoint := Point x: 9 y: 9.
	aPiece := 'somePiece'.
	self 
		should: [damasTable occupySquareAt: aDefinedTablePoint with: aPiece]
		raise: PositionOutOfTableException.
	</body>

<body package="Chekers-Test" selector="testPositiveNumberOfBoxes">testPositiveNumberOfBoxes
	self
		should: [	Table withDimensions: -8 by: -8]
		raise: CanNotCreateTableException.</body>

<body package="Chekers-Test" selector="testTotalNumberOfBoxesInATable">testTotalNumberOfBoxesInATable

	| damasTable |
	damasTable := Table withDimensions: 8 by: 8.
	self assert: damasTable numberOfBoxes = 64.</body>

<body package="Chekers-Test" selector="testWhitePieces">testWhitePieces

	| damasTable  aWhitePiece |

	damasTable := Table withDimensions: 8 by: 8.
	aWhitePiece := CheckersPiece newWhite.

	damasTable occupySquareAt: (Point x: 1 y: 2) with: aWhitePiece.

	self assert: (damasTable whitePieces includes: aWhitePiece).
	</body>
</methods>

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

<body package="Chekers-Test" selector="TestIllegalPieceMovement">TestIllegalPieceMovement
"Testea que no se pueda realizar algun movimiento a una casilla ocupada"

| aTable aPiece aPoint anotherPoint anotherPiece outSidePoint  |

aTable := Table withDimensions: 8 by: 8.
aPiece := CheckersPiece new.
aPoint := Point x: 1 y: 1.
anotherPiece := CheckersPiece new.
anotherPoint := Point x: 2 y: 2.
outSidePoint := Point x: 8 y: 9.
aTable occupySquareAt: aPoint with: aPiece.
aTable occupySquareAt: anotherPoint with: anotherPiece.

"aPiece moveTo: outSidePoint in: aTable.
aPiece moveTo: anotherPoint in: aTable.
aPiece printString"

self
	should: [ aPiece moveTo: outSidePoint in: aTable ]
	raise: PositionOutOfTableException.
self
	should: [ aPiece moveTo: anotherPoint in: aTable ]
	raise: IllegalMovementException.</body>

<body package="Chekers-Test" selector="TestPieceCreation">TestPieceCreation

| aBlackPiece aWhitePiece |
aBlackPiece := CheckersPiece newBlack.
aWhitePiece := CheckersPiece newWhite.

self
	assert: aBlackPiece isBlack;
	assert: aWhitePiece isWhite;

	deny: aBlackPiece isWhite;
	deny: aWhitePiece isBlack;

	deny: aWhitePiece = aBlackPiece;
	deny: aWhitePiece  isCrowned.
	
</body>

<body package="Chekers-Test" selector="TestPieceMovement">TestPieceMovement

| aTable aPiece aPoint oldPosition anotherPoint newPosition |

aTable := Table withDimensions: 8 by: 8.
aPiece := CheckersPiece newBlack.
aPoint := Point x: 1 y: 1.
aTable occupySquareAt: aPoint with: aPiece.
oldPosition := aPiece positionInTable: aTable.
anotherPoint := Point x: 2 y: 2.
aPiece moveTo: anotherPoint in: aTable.
newPosition := aPiece positionInTable: aTable.
self deny: (oldPosition = newPosition)</body>

<body package="Chekers-Test" selector="TestPiecePositionInTable">TestPiecePositionInTable

| aTable aPiece aPoint |

aTable := Table withDimensions: 8 by: 8.
aPiece := CheckersPiece new.
aPoint := Point x: 1 y: 1.
aTable occupySquareAt: aPoint with: aPiece.
self assert: ( ( aPiece positionInTable: aTable ) = aPoint)</body>
</methods>

<remove-selector>
<class-id>Table</class-id> <selector>initialize</selector>
</remove-selector>

<remove-selector>
<class-id>Table class</class-id> <selector>new</selector>
</remove-selector>

<methods>
<class-id>TableTest class</class-id> <category>instance creation</category>

<body package="Chekers-Test" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<methods>
<class-id>CheckersPieceTest class</class-id> <category>instance creation</category>

<body package="Chekers-Test" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


</st-source>
