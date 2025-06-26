//
//  ViewController.swift
//  Trivia
//
//  Created by Abdulahi Abdi on 6/24/25.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    
    
        
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var questionCounterLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    
    var questionsData: [(question: String, answers: [String], correctIndex: Int)] = [
        ("What is the capital of France?", ["Paris", "Berlin", "Rome", "Madrid"], 0),
        ("What is 2 + 2?", ["3", "4", "5", "6"], 1),
        ("What color are bananas?", ["Blue", "Red", "Yellow", "Green"], 2)
    ]

    var currentQuestionIndex = 0
    var score = 0

    @IBAction func answerButtonTapped(_ sender: UIButton) {
        guard let selectedIndex = answerButtons.firstIndex(of: sender) else { return }
        
        let correctIndex = questionsData[currentQuestionIndex].correctIndex
        
        if selectedIndex == correctIndex {
            score += 1
        }

        currentQuestionIndex += 1
        loadQuestion()
    }

    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        currentQuestionIndex = 0
        score = 0
        loadQuestion()
    }
    
    
    
    func loadQuestion() {
        if currentQuestionIndex < questionsData.count {
            let current = questionsData[currentQuestionIndex]
            questionLabel.text = current.question
            questionCounterLabel.text = "Question \(currentQuestionIndex + 1) of \(questionsData.count)"
            scoreLabel.text = "Score: \(score)"
            
            for i in 0..<answerButtons.count {
                answerButtons[i].isHidden = false
                answerButtons[i].setTitle(current.answers[i], for: .normal)
            }

            resetButton.isHidden = true
        } else {
            questionLabel.text = "Quiz Complete!"
            questionCounterLabel.text = ""
            scoreLabel.text = "Final Score: \(score)/\(questionsData.count)"

            for button in answerButtons {
                button.isHidden = true
            }

            resetButton.isHidden = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
    }



    
    
    
    
    
}

