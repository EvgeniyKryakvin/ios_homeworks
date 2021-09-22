//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Евгений Кряквин on 12.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class CurrentUserService: UserService {
    
    let currentUser = User(userFullName: "Eugene", userAvatar: "Honda", userStatus: "Learning Swift")
    
    func checkUser(userName: String) -> User? {
        if userName == currentUser.userFullName {
            return currentUser
        } else {
            return nil
        }
    }
}
    

