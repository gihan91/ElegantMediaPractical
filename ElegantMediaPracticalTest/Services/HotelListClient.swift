//
//  HotelListClient.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation
import Alamofire

class HotelListClient {

    static func getHotelList(completion: @escaping (Result<HotelList, Error>) -> Void) {
        AF.request(APIConfig.listHotels).responseDecodable { (response : DataResponse<HotelList>) in
            switch response.result {
            case .success(_):
                completion(response.result)
            case .failure(let error):
                APIErrorManager.handleError(statusCode: response.response?.statusCode ?? (error as? URLError)?.errorCode ?? 0)
            }
        }

    }
}
