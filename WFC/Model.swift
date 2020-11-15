// Implmentation of the "Even Simpler Tile Based Model (ESTB)" for Wave Function Collapse described in https://robertheaton.com/2018/12/17/wavefunction-collapse-algorithm/

import Foundation


protocol Model {
    
    var wavefunction: WaveFunction { get }
    
    // Fundemental methods
    func run()
    func propogate(coord: Coordinate)
    func minEntropyPosition() -> Coordinate
}

extension Model {
    func iterate() {
        let current_coord = self.minEntropyPosition()
        
    }
}

class SimplerModel: Model {
    func run() {
        <#code#>
    }
    
    func iterate() {
        <#code#>
    }
    
    func propogate(coord: Coordinate) {
        <#code#>
    }
    
    func minEntropyPosition() -> Coordinate {
        <#code#>
    }
    
}


