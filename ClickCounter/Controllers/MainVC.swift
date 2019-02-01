//
//  MainVC.swift
//  ClickCounter
//
//  Created by Jeffrey Lai on 1/31/19.
//  Copyright © 2019 Talisman Mobile. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    //Constants
    let countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 110, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    let addCountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.tintColor = .green
        button.titleLabel?.font = UIFont.systemFont(ofSize: 70, weight: .heavy)
        return button
    }()
    
    let minusCountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.tintColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 70, weight: .heavy)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupButtonActions()
    }
    
    //MARK: - Fileprivate

    //Variables
    fileprivate var count = 0
    
    //Functions
    fileprivate func setupViews() {
        
        //Initial Background Color set to white
        view.backgroundColor = .white
        
        //StackView for + and - buttons
        let buttonStackView = UIStackView(arrangedSubviews: [addCountButton, UIView(), minusCountButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    
        //Create Main Stack View
        let mainStackView = UIStackView(arrangedSubviews: [countLabel, UIView(), buttonStackView])
        mainStackView.axis = .vertical
        
        view.addSubview(mainStackView)
        
        //Autolayout that centers stackview in the center of the screen
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }
    
    fileprivate func setupButtonActions() {
        addCountButton.addTarget(self, action: #selector(incrementCount), for: .touchUpInside)
        
        minusCountButton.addTarget(self, action: #selector(decrementCount), for: .touchUpInside)
    }
    
    @objc fileprivate func incrementCount() {
        changeCount(change: 1)
        changeTextAndBackgroundColor()
    }
    
    @objc fileprivate func decrementCount() {
        changeCount(change: -1)
        changeTextAndBackgroundColor()
    }
    
    fileprivate func changeCount(change: Int) {
        if change == 1 {
            count = count + 1
            countLabel.text = "\(count)"
        } else {
            count = count - 1
            countLabel.text = "\(count)"
        }
    }
    
    //Change background color when the count is even
    fileprivate func changeTextAndBackgroundColor() {
        if count % 2 == 0 {
            view.backgroundColor = getRandomColor()
            countLabel.textColor = getRandomColor()
        }
    }

    //Returns random color by changing red, green and blue ; Sets alpha with slight transparency at 0.8
    fileprivate func getRandomColor() -> UIColor {
        //Generate Random number between 0 and 1
        let red: CGFloat = CGFloat(drand48())
        let green: CGFloat = CGFloat(drand48())
        let blue: CGFloat = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 0.8)
    }
}
