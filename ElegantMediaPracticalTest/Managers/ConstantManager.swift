//
//  ConstantManager.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation


struct ServerParam {
    static let baseUrl = "https://dl.dropboxusercontent.com/"
}

enum ContentType: String {
    case json = "application/json"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"

}

enum GoogleAPI: String {
    case apiKey = "AIzaSyAB-DPDiKO3DCUnW8G_52K4vUayc_8uDHU"
}
