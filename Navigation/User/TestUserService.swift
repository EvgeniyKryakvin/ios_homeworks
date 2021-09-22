//
//  TestUserService.swift
//  Navigation
//
//  Created by Евгений Кряквин on 23.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class TestUserService: UserService {
    
    let testUser = User(userFullName: "Test name", userAvatar: "noImage", userStatus: "Test status")
    
    func checkUser(userName: String) -> User? {
        if userName == testUser.userFullName {
            return testUser
        } else {
            return nil
        }
    }
}
