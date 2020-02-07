//
//  Game.swift
//  Apple Pie
//
//  Created by Akyya Mayberry on 2/6/20.
//  Copyright © 2020 Mayberry, Akyya. All rights reserved.
//

import Foundation

protocol GameDelegate {
    func didGuess(letter: Character, currentGame game: Game, incorrectMovesRemaining: Int)
}

struct Game {
    
    // MARK: - Properties
    
    private var _incorrectMovesRemaining: Int
    private var guessedLetters: [Character] = []
    var word: String
    var delegate: GameDelegate?
    var incorrectMovesRemaining: Int {
        get {
            return _incorrectMovesRemaining
        }
    }
    var formattedWord: String {
        get {
            var formattedString = ""
            for letter in word {
                formattedString.append(guessedLetters.contains(letter) ? letter : "_")
            }
            return formattedString
        }
    }
    
    init(word: String, incorrectMovesRemaining: Int) {
        self.word = word
        self._incorrectMovesRemaining = incorrectMovesRemaining
    }
    
    // MARK: - Methods
    
    mutating func guessLetter(_ letter: Character) {
        if !word.contains(letter) {
            _incorrectMovesRemaining -= 1
        }
        
        guessedLetters.append(letter)
        
        delegate?.didGuess(letter: letter, currentGame: self, incorrectMovesRemaining: _incorrectMovesRemaining)
        print("moves remaining: \(incorrectMovesRemaining), guessed letters: \(guessedLetters)")
    }
}
