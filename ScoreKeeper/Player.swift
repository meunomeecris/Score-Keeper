//
//  Player.swift
//  ScoreKeeper
//
//  Created by Cris Messias on 17/02/25.
//

import Foundation

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var score: Int

}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
