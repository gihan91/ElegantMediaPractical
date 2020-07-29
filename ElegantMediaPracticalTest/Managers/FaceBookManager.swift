//
//  FaceBookManager.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import FacebookLogin
import FacebookCore
import Foundation
import UIKit

/// LoginManager
public typealias LoginManager = FacebookLogin.LoginManager

/// Login Result Block
public typealias LoginResultBlock = (LoginResult) -> Void

/**
 Describes the result of a login attempt.
 */
public enum LoginResult {
    /// User succesfully logged in. Contains granted, declined permissions and access token.
    case success(granted: Set<Permission>, declined: Set<Permission>, token: AccessToken)
    /// Login attempt was cancelled by the user.
    case cancelled
    /// Login attempt failed.
    case failed(Error)

    internal init(result: LoginManagerLoginResult?, error: Error?) {
        guard let result = result, error == nil else {
            self = .failed(error ?? LoginError(.unknown))
            return
        }

        guard !result.isCancelled, let token = result.token else {
            self = .cancelled
            return
        }

        let granted: Set<Permission> = Set(result.grantedPermissions.map { Permission(stringLiteral: $0) })
        let declined: Set<Permission> = Set(result.declinedPermissions.map { Permission(stringLiteral: $0) })
        self = .success(granted: granted, declined: declined, token: token)
    }
}

public extension LoginManager {
    /**
     Initialize an instance of `LoginManager.`
     - parameter loginBehavior: Optional login behavior to use. Default: `.Native`.
     - parameter defaultAudience: Optional default audience to use. Default: `.Friends`.
     */
    convenience init(loginBehavior: LoginBehavior = .browser, defaultAudience: DefaultAudience = .friends) {
        self.init()
        self.loginBehavior = loginBehavior
        self.defaultAudience = defaultAudience
    }

    func logIn(permissions: [Permission] = [.publicProfile],
               viewController: UIViewController? = nil,
               completion: LoginResultBlock? = nil) {
        self.logIn(permissions: permissions.map { $0.name }, from: viewController, handler: sdkCompletion(completion))
    }

    private func sdkCompletion(_ completion: LoginResultBlock?) -> LoginManagerLoginResultBlock? {
        guard let completion = completion else {
            return nil
        }
        return { (result: LoginManagerLoginResult?, error: Error?) in
            let result = LoginResult(result: result, error: error)
            completion(result)
        }
    }
}

//User details
enum FacebookUserInfo: String {
    case id = "id"
    case firstName = "first_name"
    case email = "email"
    case lastName = "last_name"
}
