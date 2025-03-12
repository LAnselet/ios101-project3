//
//  TriviaViewController.swift
//  Trivia
//
//  Created by syc on 2025/3/11.
//

import UIKit

class TriviaViewController: UIViewController {
    
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionType: UILabel!
    
    @IBOutlet weak var questionDesc: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    private var triviaQuestions = [TriviaQuestion]()
    private var selectedTriviaQuestionIndex = 0
    private var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradient();
        triviaQuestions = mockData()
        configure(with: triviaQuestions[selectedTriviaQuestionIndex])
    }
    
    @IBAction func didTapFirstButton(_ sender: UIButton) {
        let currentQuestion = triviaQuestions[selectedTriviaQuestionIndex]
        if sender.currentTitle == currentQuestion.answer {
            score += 1
        }
        
        if selectedTriviaQuestionIndex < triviaQuestions.count - 1 {
            selectedTriviaQuestionIndex += 1
            configure(with: triviaQuestions[selectedTriviaQuestionIndex])
        } else {
            showGameOverPopup()
        }
    }
    
    @IBAction func didTapSecondButton(_ sender: UIButton) {
        let currentQuestion = triviaQuestions[selectedTriviaQuestionIndex]
        if sender.currentTitle == currentQuestion.answer {
            score += 1
        }
        
        if selectedTriviaQuestionIndex < triviaQuestions.count - 1 {
            selectedTriviaQuestionIndex += 1
            configure(with: triviaQuestions[selectedTriviaQuestionIndex])
        } else {
            showGameOverPopup()
        }
    }
    
    @IBAction func didTapThirdButton(_ sender: UIButton) {
        let currentQuestion = triviaQuestions[selectedTriviaQuestionIndex]
        if sender.currentTitle == currentQuestion.answer {
            score += 1
        }
        
        if selectedTriviaQuestionIndex < triviaQuestions.count - 1 {
            selectedTriviaQuestionIndex += 1
            configure(with: triviaQuestions[selectedTriviaQuestionIndex])
        } else {
            showGameOverPopup()
        }
    }
    
    @IBAction func didTapFourthButton(_ sender: UIButton) {
        let currentQuestion = triviaQuestions[selectedTriviaQuestionIndex]
        if sender.currentTitle == currentQuestion.answer {
            score += 1
        }
        
        if selectedTriviaQuestionIndex < triviaQuestions.count - 1 {
            selectedTriviaQuestionIndex += 1
            configure(with: triviaQuestions[selectedTriviaQuestionIndex])
        } else {
            showGameOverPopup()
        }
    }
    
    private func showGameOverPopup() {
        let alertController = UIAlertController(title: "Game Over!", message: "Your score: \(score)/\(triviaQuestions.count)", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default) { _ in
            self.restartGame()
        }
        alertController.addAction(restartAction)
        present(alertController, animated: true, completion: nil)
    }

    private func restartGame() {
        selectedTriviaQuestionIndex = 0
        score = 0
        configure(with: triviaQuestions[selectedTriviaQuestionIndex])
    }
    
    private func mockData() -> [TriviaQuestion] {
        let mockData1 = TriviaQuestion(number: 1, type: "History", question: "Who was the first president of the United States?", options: ["Thomas Jefferson", "George Washington", "Abraham Lincoln", "John Adams"], answer: "Geoge Washington")
        let mockData2 = TriviaQuestion(number: 2, type: "History", question: "Which ancient civilization built the pyramids in Egypt?", options: ["The Romans", "The Greeks", "The Egyptians", "The Sumerians"], answer: "The Egytians")
        let mockData3 = TriviaQuestion(number: 3, type: "History", question: "What year did World War II end?", options: ["1942", "1945", "1950", "1939"], answer: "1945")
        let mockData4 = TriviaQuestion(number: 4, type: "History", question: " Who was the first emperor of China?", options: ["Qin Shi Huang", "Han Wudi", "Cao cao", "Liu Bang"], answer: "Qin Shi Huang")
        
        return [mockData1, mockData2, mockData3, mockData4]
    }
    
    private func configure(with triviaQuestion: TriviaQuestion) {
        questionNumber.text = "Question: \(triviaQuestion.number)/\(triviaQuestions.count)"
        questionType.text = triviaQuestion.type
        questionDesc.text = triviaQuestion.question
        button1.setTitle(triviaQuestion.options[0], for: .normal)
        button2.setTitle(triviaQuestion.options[1], for: .normal)
        button3.setTitle(triviaQuestion.options[2], for: .normal)
        button4.setTitle(triviaQuestion.options[3], for: .normal)
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0.54, green: 0.88, blue: 0.99, alpha: 1.00).cgColor,
                                UIColor(red: 0.51, green: 0.81, blue: 0.97, alpha: 1.00).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

}
