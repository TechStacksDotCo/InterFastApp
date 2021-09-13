//
//  User.swift
//  InterFastApp
//
//  Created by Marc Boanas on 13/09/2021.
//

import Foundation

struct User: Hashable, Equatable, Codable {
    var username: String = "Anonymous"
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.username == rhs.username
    }
}
