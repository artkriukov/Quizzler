//
//  ViewController.swift
//  Quizzler
//
//  Created by Artem Kriukov on 05.02.2025.
//

import UIKit

class ViewController: UIViewController {

    let mainStackView = UIStackView(axis: .vertical)
    let questionLabel = UILabel(text: "Question")
    let trueButton = UIButton(text: "True")
    let falseButton = UIButton(text: "False")
    let progressBar = UIProgressView(progress: 0.5)
    let backgroundImage = UIImageView(image: Constants.backroundImage)
    
    var questionNumber = 0
    
    var question = [
        Question(questions: "A slug's blood is green.", answer: "True"),
        Question(questions: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Question(questions: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Question(questions: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Question(questions: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(questions: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(questions: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(questions: "Google was originally called 'Backrub'.", answer: "True"),
        Question(questions: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(questions: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(questions: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(questions: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        
        trueButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        falseButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        
        setViews()
        setupConstraints()
        
        updateUI()
    }
    
    @objc func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let currentQuestionNumber = question[questionNumber]
        let correctAnswer = currentQuestionNumber.answer
        
        if userAnswer == correctAnswer {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        questionNumber += 1
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        if questionNumber < question.count {
            questionLabel.text = question[questionNumber].questions
            clearBackroundButton()
            progressBar.progress = Float(questionNumber + 1) / Float(question.count)
        } else {
            questionNumber = 0
            clearBackroundButton()
            questionLabel.text = question[questionNumber].questions
            progressBar.progress = Float(questionNumber + 1)
        }
    }
    
    func clearBackroundButton() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
}

