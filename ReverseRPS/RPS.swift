//
//  RPS.swift
//  ReverseRPS
//
//  Created by Nicholas Maccharoli on 2020/03/15.
//  Copyright © 2020 Nicholas Maccharoli. All rights reserved.
//

import Foundation

enum RPS: CaseIterable {
    case rock, paper, scissors
    func isVictoryAgainst(_ input: RPS) -> Bool {
        switch self {
        case .rock where input == .scissors: return true
        case .paper where input == .rock: return true
        case .scissors where input == .paper: return true
        default:
            return false
        }
    }
    var title: String {
        switch self {
        case .rock:
            return "Rock"
        case .paper:
            return "Paper"
        case .scissors:
            return "Scissors"
        }
    }
}
