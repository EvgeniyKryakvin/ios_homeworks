//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Евгений Кряквин on 24.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView{
    //MARK: - Create Views
    private let fullNameLabel: UILabel = {
         let fullNameLabel = UILabel()
         fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
         fullNameLabel.textColor = .black
         fullNameLabel.text = "Hipster Cat"
         fullNameLabel.textAlignment = .center
         fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
         return fullNameLabel
         }()
 
     private let statusLabel: UILabel = {
         let statusLabel = UILabel()
         statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
         statusLabel.textColor = .gray
         statusLabel.text = "Waiting for something..."
         statusLabel.textAlignment = .center
         statusLabel.translatesAutoresizingMaskIntoConstraints = false
         return statusLabel
         }()
 
     private let avatarImageView: UIImageView = {
         let avatarImageView = UIImageView()
         avatarImageView.contentMode = .scaleAspectFill
         avatarImageView.image = UIImage(named: "cat2")
         avatarImageView.clipsToBounds = true
         avatarImageView.layer.borderWidth = 3
         avatarImageView.layer.borderColor = UIColor.white.cgColor
         avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
         avatarImageView.translatesAutoresizingMaskIntoConstraints = false
         return avatarImageView
         }()
 
     private let setStatusButton: UIButton = {
         let setStatusButton = UIButton()
         setStatusButton.backgroundColor = .systemBlue
         setStatusButton.setTitle("Set status", for: .normal)
         setStatusButton.layer.cornerRadius = 4
         setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
         setStatusButton.layer.shadowRadius = 4
         setStatusButton.layer.shadowColor = UIColor.black.cgColor
         setStatusButton.layer.shadowOpacity = 0.7
         setStatusButton.setTitleColor(UIColor.white, for: .normal)
         setStatusButton.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
         setStatusButton.translatesAutoresizingMaskIntoConstraints = false
         return setStatusButton
     }()
 
     private let statusTextField: UITextField = {
         let statusTextField = UITextField()
         statusTextField.backgroundColor = .white
         statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
         statusTextField.textColor = .black
         statusTextField.placeholder = "Enter your status"
         statusTextField.clipsToBounds = true
         statusTextField.layer.cornerRadius = 12
         statusTextField.layer.borderWidth = 1
         statusTextField.layer.borderColor = UIColor.black.cgColor
         statusTextField.leftView = UIView(frame: CGRect(
                                             x: 0,
                                             y: 0,
                                             width: 10,
                                             height: 40))
         statusTextField.leftViewMode = .always
         statusTextField.translatesAutoresizingMaskIntoConstraints = false
         return statusTextField
     }()
    //MARK: - Layout
    private func setupViews() {
        
        #if DEBUG
        backgroundColor = .red
        #else
        backgroundColor = .lightGray
        #endif
        //backgroundColor = .lightGray
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(avatarImageView)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        
        let constraints = [

            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),

            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),

            statusLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -30),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),

            ]
        NSLayoutConstraint.activate(constraints)
    }
    //MARK: - Avatar Corner Radius
    override func layoutSubviews() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    }
 
     override init(frame: CGRect) {
         super.init(frame: frame)
        setupViews()
        
     }
 
     required init?(coder: NSCoder) {
        super.init(coder: coder)
         setupViews()
     }
 
     @objc func statusButtonPressed() {
         if statusTextField.text != "" {
                    statusLabel.text = statusTextField.text
                 }
                else {
                 statusLabel.text = "Waiting for something..."
                 }
     }
 
}
