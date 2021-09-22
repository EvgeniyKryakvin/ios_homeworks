//
//  UserService.swift
//  Navigation
//
//  Created by Евгений Кряквин on 12.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol UserService {
    func checkUser (userName: String) -> User?
}
