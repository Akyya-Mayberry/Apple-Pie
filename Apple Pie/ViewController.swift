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
    
    @IBOutlet weak var TreeImageView: UIImageView!
    @IBOutlet weak var correctWordLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    // MARK: - Methods
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
    
}

