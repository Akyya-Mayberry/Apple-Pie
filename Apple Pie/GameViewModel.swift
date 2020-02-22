//
//  Game.swift
//  Apple Pie
//
//  Created by Akyya Mayberry on 2/6/20.
//  Copyright © 2020 Mayberry, Akyya. All rights reserved.
//

import Foundation
import UIKit

// TODO: Update delegates to be required to determine termination of game

protocol GameDelegate {
  func didGuess(letter: Character, currentGame game: GameViewModel, incorrectMovesRemaining: Int)
}

/**
 Creates an instance that manages a Game by keeping track of which letters have been guessed and how many guesses remain
 
 - Parameters
 - parameter1 word: the word to guess
 - parameter2 incorrectGuessesAllowed: number of chances to guess the word
 */
struct GameViewModel {
  
  // MARK: - Properties
  
  private let game: Game
  private var guessedLetters: [Character] = []
  private var incorrectMovesRemaining: Int
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
      UIImage(named: "Tree \(incorrectMovesRemaining)")!
    }
  }
  
  init(word: String, incorrectGuessesAllowed: Int) {
    self.incorrectMovesRemaining = incorrectGuessesAllowed
    self.game = Game(word: word, incorrectGuessesAllowed: incorrectGuessesAllowed)
  }
  
  // MARK: - Methods
  
  /**
   Makes a guess by checking if a letter is in the game's word
   
   - Parameter letter:  the character to check
   */
  mutating func guessLetter(_ letter: Character) {
    if !game.word.contains(letter) {
      incorrectMovesRemaining -= 1
    }
    
    guessedLetters.append(letter)
    
    // TODO:
    // Consider moving this to guessed letters didSet
    delegate?.didGuess(letter: letter, currentGame: self, incorrectMovesRemaining: incorrectMovesRemaining)
  }
  
  /**
   Returns the game's formatted word with each character seperated by whitespace
   */
  func getFormattedWord() -> String {
    let formattedStringAsArray = Array.init(formattedWord).map{String($0)}
    return formattedStringAsArray.joined(separator: " ")
  }
  
  /**
   Returns the game's word as characters only without formatting
   */
  func getWord() -> String {
    return game.word
  }
}
