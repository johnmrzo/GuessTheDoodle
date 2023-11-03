//
//  GuessTheDoodleApp.swift
//  GuessTheDoodle
//
//  Created by Bakhtiyorjon Mirzajonov on 10/22/23.
//

import SwiftUI

@main
struct GuessTheDoodleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(matchManager: MatchManager())
        }
    }
}
