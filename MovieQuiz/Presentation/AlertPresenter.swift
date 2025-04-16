//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Zahar Kryukov on 11.04.2025.
//

import UIKit

final class AlertPresenter {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showAlert(model: AlertModel) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: model.buttonText,
            style: .default
        ) { _ in model.completion() }
        
        alert.view.accessibilityIdentifier = "Game results"
        alert.addAction(action)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
