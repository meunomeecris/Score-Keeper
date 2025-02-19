//
//  Scoreboaord.swift
//  ScoreKeeper
//
//  Created by Cris Messias on 17/02/25.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Cris", score: 0, colorHex: "verde"),
        Player(name: "Kjay", score: 0, colorHex: "azul"),
        Player(name: "Mosquito", score: 0, colorHex: "amarelo"),
        ]
    
    var state: GameState = .setup
    var doesHighestScoreWin = true

    var winners: [Player] {
        guard state == .gameOver else { return [] }

        var winningScore = 0

        if doesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(player.score, winningScore)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(player.score, winningScore)
            }
        }

        return players.filter { player in
            player.score == winningScore
        }
    }

    mutating func resetScores(to newValue: Int) {
        for player in 0..<players.count {
            players[player].score = newValue
        }
    }

}
