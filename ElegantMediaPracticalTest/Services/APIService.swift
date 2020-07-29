//
//  APIService.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation
import Alamofire

enum APIConfig: APIConfiguration {
    case listHotels

    var method: HTTPMethod {
        switch self {
        case .listHotels:
            return .get
        }
    }

    var path: String {
        switch self {
        case .listHotels:
            return "s/6nt7fkdt7ck0lue/hotels.json"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try ServerParam.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .listHotels:
            return urlRequest
        }
    }


}


