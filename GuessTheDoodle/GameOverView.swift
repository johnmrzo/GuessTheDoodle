//
//  GameOverView.swift
//  GuessTheDoodle
//
//  Created by Bakhtiyorjon Mirzajonov on 10/22/23.
//

import SwiftUI

struct GameOverView: View {
  @ObservedObject var matchManager: MatchManager
  
  var body: some View {
    VStack {
      Spacer()
      
      Image("gameOver")
        .resizable()
        .scaledToFit()
        .padding(.horizontal, 70)
        .padding(.vertical)
      
      Text("Score: \(matchManager.score)")
        .font(.largeTitle)
        .bold()
        .foregroundColor(Color("primaryYellow"))
      
      Spacer()
      
      Button {
        matchManager.resetGame()
      } label: {
        Text("Menu")
          .foregroundStyle(Color("menuBtn"))
          .brightness(-0.4)
          .font(.largeTitle)
          .bold()
      }
      .padding()
      .padding(.horizontal, 50)
      .background(
        Capsule(style: .circular)
          .fill(Color("menuBtn"))
      )
      
      Spacer()
    }
    .background(
      Image("gameOverBg")
        .resizable()
        .scaledToFill()
        .scaleEffect(1.2)
    )
    .ignoresSafeArea()
  }
}

#Preview {
    GameOverView(matchManager: MatchManager())
}
