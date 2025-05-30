//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Zahar Kryukov on 11.04.2025.
//

import UIKit

struct GameResult {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ another: GameResult) -> Bool {
        correct > another.correct
    }
}
