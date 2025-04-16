//
//  ConvertTest.swift
//  MovieQuizTests
//
//  Created by Zahar Kryukov on 14.04.2025.
//

import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    
    func show(quiz step: QuizStepViewModel){
    }
    func showLoadingIndicator(){
    }
    func hideLoadingIndicator(){
    }
    
    func showAlert(model: AlertModel){
    }
    func showNetworkError(message: String){
    }
    
    func enableButtons(){
    }
    func disableButtons(){
    }
    func highlightImageBorder(isCorrectAnswer: Bool){
    }
    func resetImageBorder() {
    }
}

final class MovieQuizPresenterTests: XCTestCase {
    func testPresenterConvertModel() throws {
        
        let viewControllerMock = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        let viewModel = sut.convert(model: question)
        
        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question Text")
        XCTAssertEqual(viewModel.questionNumber, "1/10")
    }
}
