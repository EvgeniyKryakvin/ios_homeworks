//
//  LoginInspector.swift
//  Navigation
//
//  Created by Евгений Кряквин on 20.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class LoginInspector: LoginViewControllerDelegate {
    func check(enteredLogin: String, enteredPassword: String) -> Bool {
        return Checker.shared.checkLogin(correctLogin: enteredLogin, correctPassword: enteredPassword)
    }
    
    
}
