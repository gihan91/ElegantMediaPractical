//
//  UserDefaultManager.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation

class UserDefaultManager {
    static let loginStatus: String = "elegantmedia-login-status"

    //User defaults for login
    static func setValue(key: String, value: Bool) {
        UserDefaults.standard.set(value, forKey: key)
    }

    static func getBoolValue(key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
}


