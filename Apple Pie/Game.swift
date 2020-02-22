//
//  GameModel.swift
//  Apple Pie
//
//  Created by hollywoodno on 2/20/20.
//  Copyright © 2020 Mayberry, Akyya. All rights reserved.
//

/**
 Creates a instance with a word to guess and the number of chances allowed to guessed the word.
  - Parameters
    - parameter word: word to be guessed
    - parameter incorrectGuessesAllowed: number of chances allowed to guessed the word
*/
struct Game {
  let word: String
  var incorrectGuessesAllowed: Int
}
