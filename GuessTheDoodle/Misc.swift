//
//  Misc.swift
//  GuessTheDoodle
//
//  Created by Bakhtiyorjon Mirzajonov on 10/22/23.
//

import Foundation

let everydayObjects = ["table", "chair", "book", "lamp", "cup", "spoon", "fork", "knife", "plate", "glass", "computer", "keyboard", "mouse", "pen", "paper", "phone", "television", "remote control", "car", "bicycle", "wallet", "watch", "shoes", "hat", "umbrella", "bag", "shirt", "pants", "socks", "shampoo", "soap", "toothbrush", "toothpaste", "towel", "bed", "pillow", "blanket", "clock", "calendar", "mirror", "guitar", "camera", "sunglasses", "earphones", "key", "door", "window", "air conditioner", "refrigerator", "microwave", "oven", "coffee maker", "washing machine", "dishwasher", "vacuum cleaner", "screwdriver", "hammer", "nail", "saw", "scissors", "needle", "thread", "broom", "dustpan", "trash can", "kettle", "radio", "alarm clock", "flashlight", "wallet", "credit card", "safety pin", "hanger", "socks", "bicycle", "toilet", "sink", "bathtub", "tissue", "basket", "can opener", "tissue", "pillowcase", "frying pan", "strainer", "grater", "ladle", "tongs", "oven mitt", "tupperware", "mug", "placemat", "thermometer", "candle", "tape", "keyboard", "mouse pad", "desk", "notepad", "folder", "stapler", "staples"]


enum PlayerAuthState: String {
  case authenticating = "Logging in to Game Center..."
  case unauthenticated = "Please sign in to Game Center to play."
  case authenticated = ""
  
  case error = "There was an error loggin into the Game Center"
  case restricted = "You are not allowed to play multiplayer games!"
}

struct PastGuess: Identifiable {
  let id = UUID()
  var message: String
  var correct: Bool
}

let maxTimeRemaining = 100
