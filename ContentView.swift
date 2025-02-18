//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Cris Messias on 17/02/25.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            Tab("ScoreBoard", systemImage: "soccerball") {
                ScoreboardView()
            }

            Tab("Birthday", systemImage: "birthday.cake") {
                Birthdays()
            }
        }
    }
}
