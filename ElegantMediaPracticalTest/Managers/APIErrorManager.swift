//
//  APIErrorManager.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation
import UIKit

class APIErrorManager {
    
    static func handleError(statusCode: Int) {
        LogManager.log(LogManager.error, data: "HTTP Error: \(statusCode)")
        switch statusCode {
        case 401:
         LogManager.log(LogManager.error, data: "401")
        case -1009, -1005:
         LogManager.log(LogManager.error, data: "No InterNet")
        case -1000, -1001, -1002, -1003:
          LogManager.log(LogManager.error, data: "Cant Connect to the server")
        default:
            LogManager.log(LogManager.warn, data: "Something went wrong: \(statusCode)")
        }
    }
}

