import Foundation

// adjacencies = - which pairs of tiles can be placed next to each other in which directions
public struct AdjacencyRule: Hashable {
    let lhs: Character
    let rhs: Character
    let direction: Direction
}

// Given the input matrix find each of the adjacencies
public func calcualateAdjacencies(input: [[Character]]) -> Set<AdjacencyRule> {
    var adjacencies = Set<AdjacencyRule>()
    
    let matrixSize = (width: input[0].count, height: input.count)
    
    for (y, row) in input.enumerated() {
        for (x, tile) in row.enumerated() {
            let coord = Coordinate(x: x, y: y)
            for dir in validDirections(coord: coord, matrixSize: matrixSize) {
                let dirDelta = Direction.directionLookup[dir]!
                let adjacentTile = input[coord.y + dirDelta.y][coord.x + dirDelta.x]
                adjacencies.insert(AdjacencyRule(lhs: tile, rhs: adjacentTile, direction: dir))
            }
        }
    }
    
    return adjacencies
}

// Return how common each of the tiles are
public func calculateWeights(input: [[Character]]) -> [Character: Int] {
    var weights = [Character: Int]()
    
    for row in input {
        for tile in row {
            if let _ = weights[tile] {
                weights[tile]! += 1
            }
            else {
                weights[tile] = 1
            }
        }
    }
    
    return weights
}

// Return the valid directions from the current position
public func validDirections(coord: Coordinate, matrixSize: (width: Int, height: Int)) -> [Direction] {
    var directions = [Direction]()
    
    if coord.x > 0 {
        directions.append(.west)
    }
    
    if coord.x < matrixSize.width - 1 {
        directions.append(.east)
    }
    
    if coord.y > 0 {
        directions.append(.north)
    }
    
    if coord.y < matrixSize.height - 1 {
        directions.append(.south)
    }
    
    return directions
}

// Given an input string turn it into a 2D array of characters
public func sourceTo2Darray(input: String) -> [[Character]] {
    let rows = input.split(separator: "\n")
    return rows.map { row in
        return Array(String(row))
    }
}

// Find each unique tile in the input array
public func selectCandidates(input: [[Character]]) -> Set<Character> {
    let flatSource = input.reduce([], +)
    return Set(flatSource)
}

public struct Coordinate: Equatable {
    let x: Int
    let y: Int
    
    static func + (lhs: Coordinate, rhs: Coordinate) -> Coordinate {
        return Coordinate(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func - (lhs: Coordinate, rhs: Coordinate) -> Coordinate {
        return Coordinate(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}

public enum Direction: CaseIterable {
    case north
    case south
    case east
    case west
    
    // Coordinates assume orgin is at the top left (why north is y = -1)
    static let directionLookup: [Direction: Coordinate] = [
        .north: Coordinate(x: 0, y: -1),
        .east: Coordinate(x: 1, y: 0),
        .south: Coordinate(x: 0, y: 1),
        .west: Coordinate(x: -1, y: 0)
    ]
}

func isAdjacent(left: Character, right: Character, direction: Direction, data: Set<AdjacencyRule>) -> Bool {
    return data.contains(AdjacencyRule(lhs: left, rhs: right, direction: direction)) ? true : false
}


