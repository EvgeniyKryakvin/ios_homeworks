//
//  User.swift
//  Navigation
//
//  Created by Евгений Кряквин on 12.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class User {
    let userFullName: String
    let userAvatar: String
    let userStatus: String
    
    init (userFullName: String, userAvatar: String, userStatus: String) {
        self.userFullName = userFullName
        self.userAvatar = userAvatar
        self.userStatus = userStatus
    }
}
