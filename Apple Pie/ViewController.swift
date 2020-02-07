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
    private var totalWins = 0
    private var totalLosses = 0
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
        updateUI()
    }
    
    private func newRound() {
        currentGame = Game(word: listOfWords.removeLast(), incorrectMovesRemaining: incorrectMovesAllowed)
        print("The word is: \(currentGame.word)")
    }
    
    private func updateUI() {
        correctWordLabel.text = currentGame.formatWord(currentGame.formattedWord, separatedBy: "_")
        scoreLabel.text = "Total Wins: \(totalWins), Total Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}

// MARK: - Extensions

extension Game {
    func formatWord(_ word: String, separatedBy: String) -> String {
        let formattedStringAsArray = Array.init(word).map{String($0)}
        return formattedStringAsArray.joined(separator: " ")
    }
}

