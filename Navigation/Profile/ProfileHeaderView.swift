//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Евгений Кряквин on 24.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

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


    //MARK: - Avatar Corner Radius
    override func layoutSubviews() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    }
 
     override init(frame: CGRect) {
         super.init(frame: frame)
        //setupViews()
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(setStatusButton)
        
        avatarImageView.snp.makeConstraints { avatar in
            avatar.width.height.equalTo(120)
            avatar.top.equalTo(safeAreaLayoutGuide).offset(16)
            avatar.left.equalTo(safeAreaLayoutGuide).offset(16)
        }
            
        fullNameLabel.snp.makeConstraints { fullNL in
            fullNL.top.equalTo(safeAreaLayoutGuide).offset(27)
            fullNL.left.equalTo(avatarImageView.snp.right).offset(16)
        }
            
        statusLabel.snp.makeConstraints { status in
            status.top.equalTo(avatarImageView.snp.bottom).offset(-30)
            status.left.equalTo(fullNameLabel.snp.left)
        }
        
        statusTextField.snp.makeConstraints { statusText in
            statusText.top.equalTo(statusLabel.snp.bottom).offset(16)
            statusText.left.equalTo(fullNameLabel.snp.left)
            statusText.right.equalTo(safeAreaLayoutGuide).offset(-16)
            statusText.height.equalTo(40)
        }
        
        setStatusButton.snp.makeConstraints { setButton in
            setButton.top.equalTo(statusTextField.snp.bottom).offset(16)
            setButton.left.equalTo(safeAreaLayoutGuide).offset(16)
            setButton.right.equalTo(safeAreaLayoutGuide).offset(-16)
            setButton.height.equalTo(50)
            
        }
        

     
     }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
