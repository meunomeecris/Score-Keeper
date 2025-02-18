//
//  ScoreKeeperApp.swift
//  ScoreKeeper
//
//  Created by Cris Messias on 17/02/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftTutorialsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
