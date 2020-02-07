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
    
    var listOfWords = ["pickle", "ice skating", "superman", "california"]
    var totalWins = 0
    var totalLosses = 0
    let incorrectMovesAllowed = 7
    var currentGame: Game!
    
    // MARK: - Methods
    
    // MARK: - Lifecycle
    
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
        updateUI()
    }
    
    func newRound() {
        currentGame = Game(word: listOfWords.removeLast(), incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        print("The word is: \(currentGame.word)")
    }
    
    func updateUI() {
        correctWordLabel.text = currentGame.formattedWord
        scoreLabel.text = "Total Wins: \(totalWins), Total Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}

