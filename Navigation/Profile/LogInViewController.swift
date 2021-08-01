//
//  LogInViewController.swift
//  Navigation
//
//  Created by Евгений Кряквин on 18.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    //MARK: - Create views
    
    private let logInImage: UIImageView = {
        let logInImage = UIImageView()
        logInImage.image = UIImage(named: "logo")
        logInImage.translatesAutoresizingMaskIntoConstraints = false
        return logInImage
    }()
    
    private let emailPassField: UIView = {
       let emailPassField = UIView()
        emailPassField.layer.borderWidth = 0.5
        emailPassField.layer.borderColor = UIColor.lightGray.cgColor
        emailPassField.layer.cornerRadius = 10
        emailPassField.layer.backgroundColor = UIColor.systemGray6.cgColor
        emailPassField.translatesAutoresizingMaskIntoConstraints = false
        return emailPassField
    }()
  
    private let usernameTextField: UITextField = {
        let usernameTextField = UITextField()
        usernameTextField.textColor = .black
        usernameTextField.layer.cornerRadius = 10
        usernameTextField.font = .systemFont(ofSize: 16, weight: .regular)
        usernameTextField.autocapitalizationType = .none
        usernameTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
        usernameTextField.placeholder = "Email or phone"
        usernameTextField.leftView = UIView(frame: CGRect(
                                            x: 0,
                                            y: 0,
                                            width: 10,
                                            height: 50))
        usernameTextField.leftViewMode = .always
        usernameTextField.tintColor = UIColor(named: "ColorSet")
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return usernameTextField
    }()
    
    private let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.textColor = .black
        passwordField.layer.cornerRadius = 10
        passwordField.font = .systemFont(ofSize: 16, weight: .regular)
        passwordField.autocapitalizationType = .none
        passwordField.layer.backgroundColor = UIColor.systemGray6.cgColor
        passwordField.placeholder = "Password"
        passwordField.leftView = UIView(frame: CGRect(
                                            x: 0,
                                            y: 0,
                                            width: 10,
                                            height: 50))
        passwordField.leftViewMode = .always
        passwordField.tintColor = UIColor(named: "ColorSet")
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.isSecureTextEntry = true
        
        return passwordField
    }()
    
    private let separatorLine: UIView = {
        let separatorLine = UIView()
        separatorLine.layer.backgroundColor = UIColor.lightGray.cgColor
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        
        return separatorLine
    }()
    
    private let logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.setTitleColor(.darkGray, for: .selected)
        logInButton.setTitleColor(.darkGray, for: .highlighted)
        logInButton.setTitleColor(.darkGray, for: .disabled)
        logInButton.setTitle("Log in", for: .normal)
        logInButton.layer.cornerRadius = 10
        logInButton.clipsToBounds = true
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        return logInButton
    }()
    
    @objc private func logInButtonPressed() {
        //let controller = ProfileViewController()
        let vc =  storyboard?.instantiateViewController(identifier: "ProfileViewController")
        //navigationController?.show(controller, sender: LogInViewController())
        navigationController?.show(vc!, sender: LogInViewController())
        
        
    }
    

    
    // MARK: - Keyboard notifications
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Keyboard Actions
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(scrollView)
        scrollView.addSubview(container)
        
        container.addSubview(logInImage)
        container.addSubview(logInButton)
        container.addSubview(emailPassField)
        container.addSubview(passwordField)
        container.addSubview(usernameTextField)
        container.addSubview(separatorLine)
        
        //MARK: - Constraints
        let constraints = [
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            container.topAnchor.constraint(equalTo: scrollView.topAnchor),
            container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            

            //MARK: - Email and password field
            
            emailPassField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            emailPassField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            emailPassField.topAnchor.constraint(equalTo: logInImage.bottomAnchor, constant: 120),
            emailPassField.heightAnchor.constraint(equalToConstant: 100.0),
            emailPassField.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -16),
            
           //MARK: - Login image
            
            logInImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 120),
            logInImage.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            logInImage.widthAnchor.constraint(equalToConstant: 100.0),
            logInImage.heightAnchor.constraint(equalTo: logInImage.widthAnchor),
            
            //MARK: - Username field
            
            usernameTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 17),
            usernameTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -17),
            usernameTextField.topAnchor.constraint(equalTo: emailPassField.topAnchor, constant: 1),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50.0),
            usernameTextField.bottomAnchor.constraint(equalTo: separatorLine.topAnchor, constant: -1),
            
            //MARK: - Password field
            
            passwordField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 17),
            passwordField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -17),
            passwordField.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: -1),
            passwordField.heightAnchor.constraint(equalToConstant: 50.0),
            
            //MARK: - Separator
            
            separatorLine.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            separatorLine.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            //separatorLine.topAnchor.constraint(equalTo: usernameTextField.topAnchor, constant: 0),
            separatorLine.centerYAnchor.constraint(equalTo: emailPassField.centerYAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 0.5),
            
            //MARK: - Login button
            
            logInButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            logInButton.topAnchor.constraint(equalTo: emailPassField.bottomAnchor, constant: 16),
            logInButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50.0)
            
            
            
           
            ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    


}
