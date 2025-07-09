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
    
    
    var triviaService = TriviaQuestionService()
    var questions: [TriviaQuestion] = []
    var currentQuestionIndex = 0
    var score = 0
    var allAnswers: [String] = []


    override func viewDidLoad() {
            super.viewDidLoad()
            fetchQuestions()
        }

        func fetchQuestions() {
            triviaService.fetchTriviaQuestions { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let questions):
                        self?.questions = questions
                        self?.currentQuestionIndex = 0
                        self?.score = 0
                        self?.loadQuestion()
                    case .failure(let error):
                        print("Failed to fetch questions: \(error)")
                        // Handle error (e.g., alert)
                    }
                }
            }
        }
    
    func htmlDecodedString(_ string: String) -> String {
        guard let data = string.data(using: .utf8) else { return string }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil)
        return attributedString?.string ?? string
    }


    func loadQuestion() {
        if currentQuestionIndex < questions.count {
            let current = questions[currentQuestionIndex]
            
            // The API returns HTML entities, decode them for display:
            questionLabel.text = htmlDecodedString(current.question)
            questionCounterLabel.text = "Question \(currentQuestionIndex + 1) of \(questions.count)"
            scoreLabel.text = "Score: \(score)"
            
            // Combine and shuffle answers
            allAnswers = ([current.correct_answer] + current.incorrect_answers).shuffled()
            
            for i in 0..<answerButtons.count {
                if i < allAnswers.count {
                    answerButtons[i].isHidden = false
                    answerButtons[i].setTitle(htmlDecodedString(allAnswers[i]), for: .normal)
                } else {
                    answerButtons[i].isHidden = true
                }
            }
            
            resetButton.isHidden = true
        } else {
            questionLabel.text = "Quiz Complete!"
            questionCounterLabel.text = ""
            scoreLabel.text = "Final Score: \(score)/\(questions.count)"
            
            for button in answerButtons {
                button.isHidden = true
            }
            
            resetButton.isHidden = false
        }
    }


        @IBAction func answerButtonTapped(_ sender: UIButton) {
            guard let selectedIndex = answerButtons.firstIndex(of: sender),
                  currentQuestionIndex < questions.count else { return }

            let current = questions[currentQuestionIndex]
            let correctAnswer = current.correct_answer

            if allAnswers[selectedIndex] == correctAnswer {
                score += 1
            }

            currentQuestionIndex += 1
            loadQuestion()
        }

        @IBAction func resetButtonTapped(_ sender: UIButton) {
            fetchQuestions()
        }
    
    
    
    
}

