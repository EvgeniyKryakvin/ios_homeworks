//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Евгений Кряквин on 20.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol LoginViewControllerDelegate: AnyObject {
    func check(enteredLogin: String, enteredPassword: String) -> Bool
}
