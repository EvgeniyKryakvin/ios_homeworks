//
//  LoginFactory.swift
//  Navigation
//
//  Created by Евгений Кряквин on 22.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol LoginFactory {
    func createLoginInspector() -> LoginInspector
}

class MyLoginFactory: LoginFactory {
    func createLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
    
    
}
