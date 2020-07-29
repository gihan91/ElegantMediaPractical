//
//  HotelListModel.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation

struct HotelList: Codable {
    let data: [listOfData]


}

struct listOfData: Codable {
    let title, description, address, latitude, longitude: String
    let image: ImageData?

}

struct ImageData: Codable {
    let small, medium, large: String
}
