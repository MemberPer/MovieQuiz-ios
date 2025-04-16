//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Zahar Kryukov on 11.04.2025.
//

import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: () -> Void
}
