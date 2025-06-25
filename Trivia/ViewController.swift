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
    @IBOutlet var answerButtons: [UIButton]! 
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!

    var questions: [(question: String, answers: [String], correctIndex: Int)] = [
        ("What is the capital of France?", ["Paris", "Berlin", "Rome", "Madrid"], 0),
        ("What is 2 + 2?", ["3", "4", "5", "6"], 1),
        ("What color are bananas?", ["Blue", "Red", "Yellow", "Green"], 2)
    ]
    
    var currentQuestionIndex = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
    }

    func loadQuestion() {
        if currentQuestionIndex < questions.count {
            let current = questions[currentQuestionIndex]
            questionLabel.text = current.question
            for i in 0..<answerButtons.count {
                answerButtons[i].setTitle(current.answers[i], for: .normal)
                answerButtons[i].isHidden = false
            }
            restartButton.isHidden = true
            scoreLabel.text = "Score: \(score)"
        } else {
            questionLabel.text = "Quiz Complete!"
            for button in answerButtons {
                button.isHidden = true
            }
            restartButton.isHidden = false
            scoreLabel.text = "Final Score: \(score)/\(questions.count)"
        }
    }

    @IBAction func answerButtonTapped(_ sender: UIButton) {
        guard let index = answerButtons.firstIndex(of: sender) else { return }
        let correctIndex = questions[currentQuestionIndex].correctIndex
        if index == correctIndex {
            score += 1
        }
        currentQuestionIndex += 1
        loadQuestion()
    }

    @IBAction func restartTapped(_ sender: UIButton) {
        currentQuestionIndex = 0
        score = 0
        loadQuestion()
    }
}

