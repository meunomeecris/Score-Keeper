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
    var colorHex: String

    init(id: UUID = UUID(), name: String, score: Int, colorHex: String) {
        self.id = id
        self.name = name
        self.score = score
        self.colorHex =  ColorPlayer.randomColor().color
    }
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}

enum ColorPlayer: CaseIterable {
    case green, red, yellow, blue, black

    var color: String {
        switch self {
        case .green: return "verde"
        case .red: return "vermelho"
        case .yellow: return "amarelo"
        case .blue: return "azul"
        case .black: return "primario"

        }
    }

    static func randomColor() -> ColorPlayer {
        return allCases.randomElement() ?? .black
    }
}
