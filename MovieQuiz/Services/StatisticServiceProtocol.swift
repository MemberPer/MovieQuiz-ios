//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Zahar Kryukov on 11.04.2025.
//

import UIKit

protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    
    func store(correct count: Int, total amount: Int)
}
