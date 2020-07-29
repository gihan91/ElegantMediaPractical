//
//  MapViewController.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    // MARK: UI Reference

    // MARK: Class Variables
    var hotelListObj: listOfData?

     // MARK: Main Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()


    }

    private func setupMap() {
        if let lat = hotelListObj?.longitude.toDouble(), let long = hotelListObj?.longitude.toDouble() {
            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 6.0)
            let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
            self.view.addSubview(mapView)
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
            marker.title = hotelListObj?.address
            marker.map = mapView
        }
    }

}


