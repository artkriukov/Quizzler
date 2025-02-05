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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        
        setViews()
        setupConstraints()
    }
}

