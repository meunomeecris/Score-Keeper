//
//  File.swift
//  Toolbox
//
//  Created by Cris Messias on 18/02/25.
//

import SwiftUI

struct ScoreboardView: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0

    var body: some View {
        VStack(alignment: .leading) {
            //Title - editButton
            HStack {
                Text("Score Keeper")
                    .font(.title)
                    .bold()
                    .padding(.bottom)

                Spacer()
                EditButton()
            }
            .padding(.horizontal, 16)

            //Game Rules
            SettingsView(startingPoints: $startingPoints, doesHighestScoreWin: $scoreboard.doesHighestScoreWin)
                .disabled(scoreboard.state != .setup)
                .padding(.horizontal, 16)


            // Players
            List {
                HStack {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                        .opacity(scoreboard.state == .setup ? 0 : 1.0)
                }
                .font(.headline)

                ForEach($scoreboard.players) { $player in
                    HStack {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(Color.yellow)
                            }

                            TextField("Name", text: $player.name)
                                .disabled(scoreboard.state != .setup)
                        }


                            Text("\(player.score)")
                                .opacity(scoreboard.state == .setup ? 0 : 1.0)

                            Stepper("\(player.score)", value: $player.score)
                                .labelsHidden()
                                .opacity(scoreboard.state == .setup ? 0 : 1.0)

                    }
                }
                .onDelete { scoreboard.players.remove(atOffsets: $0) }
                .onMove {scoreboard.players.move(fromOffsets: $0, toOffset: $1)}
            }
            .padding(.vertical)

        } //End VStack

        Button("Add Player", systemImage: "plus") {
            scoreboard.players.append(Player(name: "", score: 0))
        }
        .opacity(scoreboard.state == .setup ? 1.0 : 0)

        //Button Game Controller
        HStack {
            Spacer()
            switch scoreboard.state {
            case .setup:
                Button("Start Game", systemImage: "play.fill") {
                    scoreboard.state = .playing
                    scoreboard.resetScores(to: startingPoints)
                }
            case .playing:
                Button("End Game", systemImage: "stop.fill") {
                    scoreboard.state = .gameOver
                }
            case .gameOver:
                Button("Reset Game", systemImage: "arrow.counterclockwise") {
                    scoreboard.state = .setup
                }
            }
            Spacer()
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .tint(.green)
    }
}


/*
 List {
 Grid {
 GridRow {
 Text("Player")
 .gridColumnAlignment(.leading)
 Text("Score")
 .opacity(scoreboard.state == .setup ? 0 : 1.0)
 }
 .font(.headline)
 ForEach($scoreboard.players) { $player in
 GridRow {
 HStack {
 if scoreboard.winners.contains(player) {
 Image(systemName: "crown.fill")
 .foregroundStyle(Color.yellow)
 }

 TextField("Name", text: $player.name)
 .disabled(scoreboard.state != .setup)
 }

 HStack {
 Text("\(player.score)")
 .opacity(scoreboard.state == .setup ? 0 : 1.0)

 Stepper("\(player.score)", value: $player.score)
 .labelsHidden()
 .opacity(scoreboard.state == .setup ? 0 : 1.0)
 }
 }
 }
 .onDelete { scoreboard.players.remove(atOffsets: $0) }
 .onMove {scoreboard.players.move(fromOffsets: $0, toOffset: $1)}
 */
