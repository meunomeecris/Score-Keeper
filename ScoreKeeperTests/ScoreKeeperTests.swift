//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Cris Messias on 17/02/25.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {

    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players:[
            Player(name: "Mosquito", score: 13),
            Player(name: "Miaumiaumiau", score: 3)
            ])
        scoreboard.resetScores(to: newValue)

        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }

    @Test("Highest score wins")
    func highestScoreWins() async throws {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Mosquito", score: 13),
                Player(name: "Miaumiaumiau", score: 3)
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Mosquito", score: 13)])
    }

    @Test("Lowest score win")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Mosquito", score: 13),
                Player(name: "Miaumiaumiau", score: 3)
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Miaumiaumiau", score: 3)])

    }
}
