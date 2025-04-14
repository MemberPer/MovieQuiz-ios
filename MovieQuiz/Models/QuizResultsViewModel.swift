//
//  QuizResultsViewModel.swift
//  MovieQuiz
//
//  Created by Zahar Kryukov on 11.04.2025.
//

import Foundation

struct QuizResultsViewModel {
    let correctAnswers: Int
    let totalQuestions: Int
    let resultText: String
      
    init(correctAnswers: Int, totalQuestions: Int) {
        self.correctAnswers = correctAnswers
        self.totalQuestions = totalQuestions
        self.resultText = "Ваш результат: \(correctAnswers) из \(totalQuestions)"
    }
}
