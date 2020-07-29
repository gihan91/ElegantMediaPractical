//
//  AuthenticationManager.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation
import UIKit

class AuthenticationManager {

    static func updateRootVC(){

           let status = UserDefaults.standard.bool(forKey: UserDefaultManager.loginStatus)
           var rootVC : UIViewController?


           if status{
               rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HotelVC") as! HotelsListViewController
           }else{
               rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC") as! LoginViewController
           }

           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           appDelegate.window?.rootViewController = rootVC

       }
}
