import Foundation

/*
 Double Pipe Characters:
    1. ══    ║
 
    2. ╔    ╗    ╚   ╝
 
    3. ╠    ╣    ╦    ╩
 
    4. ╬
 
 Adjacency definition #1:
 ╔╗╔═╗╔╦╗
 ║╚╝╔╬╝╠╝
 ╚══╩╩╦╣
      ╚╝
 
 Adjacency definition #2:
 ║ ╔╦╗
 ║ ╠╬╣
 ║ ╚╩╝
   ═══
*/

let source = """
╔╗╔═╗╔╦╗\n
║╚╝╔╬╝╠╝\n
╚══╩╩╦╣ \n
     ╚╝ \n
"""

let source2 = """
      \n
║ ╔╦╗ \n
║ ╠╬╣ \n
║ ╚╩╝ \n
      \n
  ═══ \n
"""

let source2D = sourceTo2Darray(input: source)
let candidates = selectCandidates(input: source2D)

let adjacencies = calcualateAdjacencies(input: source2D)
let weights = calculateWeights(input: source2D)

//print(adjacencies)
