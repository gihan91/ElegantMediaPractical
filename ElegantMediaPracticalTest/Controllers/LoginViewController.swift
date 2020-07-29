//
//  LoginViewController.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit
import UIKit
import FacebookLogin
import FacebookCore
import Foundation

class LoginViewController: UIViewController {

    // MARK: UI Reference
    @IBOutlet var btnLoginWithFacebook: RoundConerShadowButton!

    // MARK: Class Variables


    // MARK: Main Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        let status = UserDefaults.standard.bool(forKey: UserDefaultManager.loginStatus)
        print("::::Status is here \(status)")

    }

    // MARK: Access API Data
    private func facebookLogin() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [Permission.email], viewController: self) { result in
            self.loginManagerDidComplete(result)

        }
    }

    func loginManagerDidComplete(_ result: LoginResult) {
        switch result {
        case .success( _, _, let token):
            if token.tokenString != "" {
                let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields":"email,first_name,last_name"], httpMethod: .get)
                graphRequest.start(completionHandler: { ( _, result, error) in
                    if error == nil {
                        if let responseDictionary = result as? NSDictionary {
                            let firstName = responseDictionary[FacebookUserInfo.firstName.rawValue] as! String
                            let lastName = responseDictionary[FacebookUserInfo.lastName.rawValue] as! String
                            let email = responseDictionary[FacebookUserInfo.email.rawValue] as! String
                            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                            if let viewController = mainStoryboard.instantiateViewController(
                                withIdentifier: "HotelVC") as? HotelsListViewController {
                                viewController.fbUserName = firstName
                                viewController.fbEmail = email
                                UserDefaultManager.setValue(key: UserDefaultManager.loginStatus, value: true)
                                self.navigationController?.pushViewController(viewController, animated: true)

                            }
                        }
                    }
                })
            }
        case .cancelled:
            LogManager.log(LogManager.warn, data: "User Cancel the facebook login")

        case .failed(let error):
            LogManager.log(LogManager.error, data: error)
        }

    }

    // MARK: Actions
    @IBAction func actionFacebookLogin(_ sender: Any) {
        facebookLogin()
    }
}
