//
//  MovieQuizControllerProtocol.swift
//  MovieQuiz
//
//  Created by Zahar Kryukov on 14.04.2025.
//

import UIKit

protocol MovieQuizViewControllerProtocol: AnyObject {
    
    func show(quiz step: QuizStepViewModel)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showAlert(model: AlertModel)
    func showNetworkError(message: String)
    
    func enableButtons()
    func disableButtons()
    func highlightImageBorder(isCorrectAnswer: Bool)
    func resetImageBorder()
}
