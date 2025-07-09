//
//  ViewController 2.swift
//  Trivia
//
//  Created by Abdulahi Abdi on 7/7/25.
//


//
//  ViewController.swift
//  Trivia
//
//  Created by Abdulahi Abdi on 6/24/25.
//

import Foundation

struct TriviaResponse: Decodable {
    let results: [TriviaQuestion]
}

struct TriviaQuestion: Decodable {
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}





