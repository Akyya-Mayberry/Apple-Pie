//
//  Game.swift
//  Apple Pie
//
//  Created by Akyya Mayberry on 2/6/20.
//  Copyright © 2020 Mayberry, Akyya. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func guessLetter(_ letter: Character) {
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
        
        guessedLetters.append(letter)
        print("moves remaining: \(incorrectMovesRemaining), guessed letters: \(guessedLetters)")
    }
}
