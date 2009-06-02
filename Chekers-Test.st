<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.5 of April 16, 2007 on May 31, 2009 at 4:25:33 pm</time-stamp>
<!-- Package Changes for Chekers-Test* -->


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

aTable := CheckersTable withDimensions: 8 by: 8.
aPiece := CheckersPiece new.
aPoint := 1.
anotherPiece := CheckersPiece new.
anotherPoint := 5.
outSidePoint := 0.
aTable occupySquareAt: aPoint with: aPiece.
aTable occupySquareAt: anotherPoint with: anotherPiece.

self
	should: [ aTable movePieceFrom: aPoint to: outSidePoint ]
	raise: PositionOutOfTableException.
self
	should: [ aTable movePieceFrom: anotherPoint to:  aPoint]
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

<body package="Chekers-Test" selector="TestPieceCrown">TestPieceCrown
	
	| aCheckersPiece |
	aCheckersPiece := CheckersPiece newBlack.
	aCheckersPiece crown.
	self assert: aCheckersPiece isCrowned.</body>

<body package="Chekers-Test" selector="TestPieceMovement">TestPieceMovement

| aTable aPiece aPoint oldPosition anotherPoint newPosition |

aTable := CheckersTable withDimensions: 8 by: 8.
aPiece := CheckersPiece newBlack.
aPoint := 1.
aTable occupySquareAt: aPoint with: aPiece.
oldPosition := aPiece positionInTable: aTable.
anotherPoint := 5.
aTable movePieceFrom: aPoint to: anotherPoint.
newPosition := aPiece positionInTable: aTable.
self deny: (oldPosition = newPosition)</body>

<body package="Chekers-Test" selector="TestPiecePositionInTable">TestPiecePositionInTable

| aTable aPiece aPoint |

aTable := CheckersTable withDimensions: 8 by: 8.
aPiece := CheckersPiece new.
aPoint := 1.
aTable occupySquareAt: aPoint with: aPiece.
self assert:  ( aPiece positionInTable: aTable ) = aPoint</body>
</methods>

<methods>
<class-id>CheckersPieceTest class</class-id> <category>instance creation</category>

<body package="Chekers-Test" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<class>
<name>CheckersGameTest</name>
<environment>Smalltalk</environment>
<super>CheckersPieceTest</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Chekers-Test</category>
<attributes>
<package>Chekers-Test</package>
</attributes>
</class>

<methods>
<class-id>CheckersGameTest</class-id> <category>initialize-release</category>

<body package="Chekers-Test" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>CheckersGameTest</class-id> <category>initializeGameTest</category>

<body package="Chekers-Test" selector="testFirstMove">testFirstMove

| checkersGame pieceToMove board |

checkersGame := CheckersGame withInitialConfiguration.

board := checkersGame checkersTable.

pieceToMove := board pieceAtSqueare: 9.

pieceToMove  moveTo: 13 in: board.

self
	assert: (pieceToMove positionInTable: board) = 13</body>

<body package="Chekers-Test" selector="testGameCreation">testGameCreation

| checkersGame |

checkersGame := CheckersGame withInitialConfiguration.

self
	assert: checkersGame whitePiecesInGame = 12;
	assert: checkersGame blackPiecesInGame = 12.
 </body>

<body package="Chekers-Test" selector="testJumpMove">testJumpMove

| checkersGame blackPieceToJump aCheckersTable |

checkersGame := CheckersGame withJumpConfiguration.

aCheckersTable := checkersGame checkersTable.

blackPieceToJump := aCheckersTable pieceAtSqueare: 1.
aCheckersTable movePieceFrom: 1 to: 10.

self
	assert: (blackPieceToJump positionInTable: aCheckersTable) = 10;
	deny: ( aCheckersTable hasAPieceAt: 6 ).</body>
</methods>

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

<body package="Chekers-Test" selector="testFreeASquare">testFreeASquare

	| checkersTable piece tablePoint |
	checkersTable := CheckersTable withDimensions: 8 by: 8.
	piece := CheckersPiece new.
	tablePoint := Point x: 1 y: 2.
	checkersTable occupySquareAt: tablePoint with: piece.
	checkersTable freeSquareAt: tablePoint.
	self deny: ( checkersTable hasAPieceAt: tablePoint)
	</body>

<body package="Chekers-Test" selector="testNumberOfBoxForATable">testNumberOfBoxForATable

| damasTable |
	damasTable := CheckersTable withDimensions: 8 by: 8.
	self assert: damasTable xNumberOfSquares = 8.
 	self assert: damasTable yNumberOfSquares = 8.</body>

<body package="Chekers-Test" selector="testOcuppyASquare">testOcuppyASquare

	| damasTable  aPiece aDefinedTablePoint aNotDefinedTablePoint |

	damasTable := CheckersTable withDimensions: 8 by: 8.
	aDefinedTablePoint := Point x: 1 y: 1.
	aNotDefinedTablePoint := Point x: 2 y: 1.
	aPiece := 'somePiece'.
	damasTable occupySquareAt: aDefinedTablePoint with: aPiece.
	self assert: (damasTable hasAPieceAt: aDefinedTablePoint).
	self deny: (damasTable hasAPieceAt: aNotDefinedTablePoint).</body>

<body package="Chekers-Test" selector="testOcuppyBoxInARange">testOcuppyBoxInARange
	
	| damasTable  aPiece aDefinedTablePoint |
	
	damasTable := CheckersTable withDimensions: 8 by: 8.
	aDefinedTablePoint := 33.
	aPiece := 'somePiece'.
	self 
		should: [damasTable occupySquareAt: aDefinedTablePoint with: aPiece]
		raise: PositionOutOfTableException.</body>

<body package="Chekers-Test" selector="testPositiveNumberOfBoxes">testPositiveNumberOfBoxes
	self
		should: [	CheckersTable withDimensions: -8 by: -8]
		raise: CanNotCreateTableException.</body>

<body package="Chekers-Test" selector="testTotalNumberOfBoxesInATable">testTotalNumberOfBoxesInATable

	| damasTable |
	damasTable := CheckersTable withDimensions: 8 by: 8.
	self assert: damasTable numberOfSquares = 64.</body>

<body package="Chekers-Test" selector="testWhitePieces">testWhitePieces

	| damasTable  aWhitePiece |

	damasTable := CheckersTable withDimensions: 8 by: 8.
	aWhitePiece := CheckersPiece newWhite.

	damasTable occupySquareAt: (Point x: 1 y: 2) with: aWhitePiece.

	self assert: (damasTable whitePieces includes: aWhitePiece).
	</body>
</methods>

<methods>
<class-id>TableTest class</class-id> <category>instance creation</category>

<body package="Chekers-Test" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


</st-source>
