import UIKit

final class MovieQuizViewController: UIViewController, MovieQuizViewControllerProtocol {
    
    //MARK: - Outlets
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet private var yesButton: UIButton!
    @IBOutlet private var noButton: UIButton!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Private Properties
    private lazy var presenter = MovieQuizPresenter(viewController: self)
    private var alertPresenter: AlertPresenter?
    
    private var questionFactory: QuestionFactory?
    private var statisticService: StatisticServiceProtocol?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieQuizPresenter(viewController: self)
        alertPresenter = AlertPresenter(viewController: self)
        statisticService = StatisticService()
        
        presenter.loadData()
        setupUI()
        showLoadingIndicator()
    }
    
    //MARK: - Public Methods
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrectAnswer ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
     }
    func resetImageBorder() {
        imageView.layer.borderWidth = 0
    }
    
    func enableButtons() {
        yesButton.isEnabled = true
        noButton.isEnabled = true
    }
    func disableButtons() {
        yesButton.isEnabled = false
        noButton.isEnabled = false
    }
    
    func showLoadingIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func showAlert(model: AlertModel) {
        alertPresenter?.showAlert(model: model)
    }
    
    func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        counterLabel.text = step.questionNumber
        textLabel.text = step.question
     }
    
    func showNetworkError(message: String) {
        hideLoadingIndicator()
        let model = AlertModel(title: "Ошибка",
                               message: message,
                               buttonText: "Попробовать еще раз") { [weak self] in
            
            guard let self = self else { return }

            self.presenter.restartGame()
            self.presenter.loadData()
            }
        alertPresenter?.showAlert(model: model)
    }
    
    //MARK: - Private Methods
    private func setupUI() {
        setupImageView()
        setupButtonStyle(yesButton)
        setupButtonStyle(noButton)
    }

    private func setupImageView() {
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
    }
    
    private func setupButtonStyle(_ button: UIButton) {
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
    }
    
    //MARK: - Actions
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        presenter.yesButtonClicked()
    }
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        presenter.noButtonClicked()
    }
}
