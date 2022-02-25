//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var optionA: UIButton!
    @IBOutlet var optionB: UIButton!
    @IBOutlet var optionC: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    var questions = Questions()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        
        if questions.checkAnswer(userAnswer!) {
            sender.backgroundColor = .systemGreen
        } else {
            sender.backgroundColor = .systemRed
        }
    
        questions.nextQuestion()
//        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)

        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            self.updateUI()
        }
    }
    
    func updateUI() {
        questionLabel.text = questions.getQuestion()
        progressBar.progress = questions.getProgress()
        scoreLabel.text = "Score: \(questions.getScore())"
        
        let options = questions.quiz[questions.number].answerOptions
        
    optionA.setTitle(options[0], for: .normal)
    optionB.setTitle(options[1], for: .normal)
    optionC.setTitle(options[2], for: .normal)
        
        optionA.backgroundColor = .clear
        optionB.backgroundColor = .clear
        optionC.backgroundColor = .clear
    }
}

