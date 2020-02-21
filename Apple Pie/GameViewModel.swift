//
//  Game.swift
//  Apple Pie
//
//  Created by Akyya Mayberry on 2/6/20.
//  Copyright © 2020 Mayberry, Akyya. All rights reserved.
//

import Foundation
import UIKit

protocol GameDelegate {
  func didGuess(letter: Character, currentGame game: GameViewModel, incorrectMovesRemaining: Int)
}

struct GameViewModel {
  
  // MARK: - Properties
  
  private var game: GameModel
  private var guessedLetters: [Character] = []
  var delegate: GameDelegate?
  
  var formattedWord: String {
    get {
      var formattedString = ""
      for letter in game.word {
        formattedString.append(guessedLetters.contains(letter) ? letter : "_")
      }
      return formattedString
    }
  }
  
  var treeImage: UIImage {
    get {
      UIImage(named: "Tree \(game.incorrectMovesRemaining)")!
    }
  }
  
  init(word: String, incorrectMovesRemaining: Int) {
    self.game = GameModel(word: word, incorrectMovesRemaining: incorrectMovesRemaining)
  }
  
  // MARK: - Methods
  
  mutating func guessLetter(_ letter: Character) {
    if !game.word.contains(letter) {
      game.incorrectMovesRemaining -= 1
    }
    
    guessedLetters.append(letter)
    
    delegate?.didGuess(letter: letter, currentGame: self, incorrectMovesRemaining: game.incorrectMovesRemaining)
  }
  
  func getFormattedWord() -> String {
    return formatWord(formattedWord, separatedBy: "_")
  }
  
  func getWord() -> String {
    return game.word
  }
}

extension GameViewModel {
  func formatWord(_ word: String, separatedBy: String) -> String {
    let formattedStringAsArray = Array.init(word).map{String($0)}
    return formattedStringAsArray.joined(separator: " ")
  }
}
