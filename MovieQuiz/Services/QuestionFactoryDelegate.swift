//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Zahar Kryukov on 11.04.2025.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}
