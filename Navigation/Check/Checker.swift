//
//  Checker.swift
//  Navigation
//
//  Created by Евгений Кряквин on 20.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
class Checker {
    
    private let login = "Eugene"
    private let password = "qwerty"
    
    static let shared = Checker()
    
    private init() {}
    
    func checkLogin(correctLogin: String, correctPassword: String) -> Bool {
        if login == correctLogin && password == correctPassword {
            return true
        } else {
            return false
        }
    }
}
