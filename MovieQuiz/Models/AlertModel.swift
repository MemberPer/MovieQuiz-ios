//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Zahar Kryukov on 11.04.2025.
//

import Foundation

struct AlertModel {
    var title: String
    var message: String
    let buttonText: String
    let completion: (() -> Void)?
}
