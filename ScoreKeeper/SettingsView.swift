//
//  SettingsView.swift
//  ScoreKeeper
//
//  Created by Cris Messias on 17/02/25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var startingPoints: Int
    @Binding var doesHighestScoreWin: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)

            Divider()
            
            Picker("Win condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }

            Picker("Starting Points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in:  .rect(cornerRadius: 10.0))
    }
}
