//
//  User.swift
//  BYOA Chess
//
//  Created by Chase on 2/22/23.
//

import Foundation
import UIKit

class User {
    
    let avatar: String
    let name: String
    let username: String
    let followers: Int
    let location: String
    let league: String
    
    init(avatar: String, name: String, username: String, followers: Int, location: String, league: String) {
        
        self.avatar = avatar
        self.name = name
        self.username = username
        self.followers = followers
        self.location = location
        self.league = league
    }
}

extension User {
    
    enum Keys: String {
        case avatar
        case name
        case username
        case followers
        case location
        case league
    }
    
    convenience init?(dictionary: [String : Any]) {
        
        guard let avatar = dictionary[Keys.avatar.rawValue] as? String,
              let name = dictionary[Keys.name.rawValue] as? String,
              let username = dictionary[Keys.username.rawValue] as? String,
              let followers = dictionary[Keys.followers.rawValue] as? Int,
              let location = dictionary[Keys.location.rawValue] as? String,
              let league = dictionary[Keys.league.rawValue] as? String else {
              print("\(#file)\(#line)")
              return nil
        }
        
        self.init(avatar: avatar, name: name, username: username, followers: followers, location: location, league: league)
    }
}
