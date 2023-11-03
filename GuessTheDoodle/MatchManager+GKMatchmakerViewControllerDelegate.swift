//
//  MatchManager+GKMatchmakerViewControllerDelegate.swift
//  GuessTheDoodle
//
//  Created by Bakhtiyorjon Mirzajonov on 10/22/23.
//

import Foundation
import GameKit

extension MatchManager: GKMatchmakerViewControllerDelegate {
  func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
    viewController.dismiss(animated: true)
    startGame(newMatch: match)
  }
  
  func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
    viewController.dismiss(animated: true)
  }
  
  func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
    viewController.dismiss(animated: true)
  }
}
