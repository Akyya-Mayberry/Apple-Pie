//
//  ViewController.swift
//  Apple Pie
//
//  Created by Akyya Mayberry on 2/6/20.
//  Copyright © 2020 Mayberry, Akyya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet weak var treeImageView: UIImageView!
  @IBOutlet weak var correctWordLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet var letterButtons: [UIButton]!
  
  private let incorrectMovesAllowed = 7
  private var listOfWords = ["pickle", "ice skating", "superman", "california"]
  private var totalWins = 0 {
    didSet {
      newRound()
    }
  }
  private var totalLosses = 0 {
    didSet {
      newRound()
    }
  }
  private var currentGame: Game!
  
  // MARK: - Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    newRound()
    updateUI()
  }
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    sender.isEnabled = false
    let letterString = sender.title(for: .normal)!
    let character = Character(letterString.lowercased())
    currentGame.guessLetter(character)
  }
  
  private func newRound() {
    if !listOfWords.isEmpty {
      currentGame = Game(word: listOfWords.removeLast(), incorrectMovesRemaining: incorrectMovesAllowed)
      currentGame.delegate = self
      
      enableLetterButtons(true)
      
      print("The word is: \(currentGame.word)")
      updateUI()
    } else {
      enableLetterButtons(false)
    }
  }
  
  private func updateUI() {
    correctWordLabel.text = currentGame.getFormattedWord()
    scoreLabel.text = "Total Wins: \(totalWins), Total Losses: \(totalLosses)"
    treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
  }
  
  private func enableLetterButtons(_ enable: Bool) {
    for button in letterButtons {
      button.isEnabled = enable
    }
  }
  
}

// MARK: - Extensions

extension ViewController: GameDelegate {
  func didGuess(letter: Character, currentGame game: Game, incorrectMovesRemaining: Int) {
    DispatchQueue.main.async {
      
      let isWinner = self.currentGame.word == self.currentGame.formattedWord
      
      if incorrectMovesRemaining < 1 {
        self.totalLosses += 1
      } else if isWinner {
        self.totalWins += 1
      } else {
        self.updateUI()
      }
    }
  }
}
