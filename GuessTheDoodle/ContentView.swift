//
//  ContentView.swift
//  GuessTheDoodle
//
//  Created by Bakhtiyorjon Mirzajonov on 10/22/23.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var matchManager: MatchManager
  
  var body: some View {
    ZStack {
      if matchManager.isGameOver {
        GameOverView(matchManager: matchManager)
      } else if matchManager.inGame {
        GameView(matchManager: matchManager)
      } else {
        MenuView(matchManager: matchManager)
      }
    }
    .onAppear {
      matchManager.authenticateUser()
    }
  }
}

#Preview {
    ContentView(matchManager: MatchManager())
}
