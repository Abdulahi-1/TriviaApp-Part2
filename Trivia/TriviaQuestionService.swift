//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Abdulahi Abdi on 7/7/25.
//

import Foundation

class TriviaQuestionService {
    
    func fetchTriviaQuestions(completion: @escaping (Result<[TriviaQuestion], Error>) -> Void) {
        
        let urlString = "https://opentdb.com/api.php?amount=5&category=18"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }
            
            do {
                let triviaResponse = try JSONDecoder().decode(TriviaResponse.self, from: data)
                completion(.success(triviaResponse.results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}




