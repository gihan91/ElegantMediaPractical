//
//  HotelsListViewController.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit

class HotelsListViewController: UIViewController {

    @IBOutlet var tblHotelList: UITableView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblEmail: UILabel!

    var fbUserName: String?
    var fbEmail: String?
    var listOfHotelArray: [listOfData] = []
    var hotelListObj: HotelList?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        tblHotelList.register(UINib(nibName: "HotelListTableViewCell", bundle: nil), forCellReuseIdentifier: "hotelListCell")
        self.tblHotelList.delegate = self
        self.tblHotelList.dataSource = self
        self.getHotelList()
    }

    fileprivate func setupUI() {
        self.lblEmail.text = self.fbEmail
        self.lblName.text = self.fbUserName
    }

    private func getHotelList() {
        HotelListClient.getHotelList { (response) in
            switch response {
            case .success(let result):
                self.listOfHotelArray = result.data
                self.hotelListObj = result
                self.tblHotelList.reloadData()
            case .failure(let err):
                print(err)
            }
        }
    }


}

extension HotelsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfHotelArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotelListCell", for: indexPath) as! HotelListTableViewCell
        let hotelObj = self.listOfHotelArray[indexPath.row]
        cell.setData(data: hotelObj)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hotelObj = self.listOfHotelArray[indexPath.row]
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let viewController = mainStoryboard.instantiateViewController(
            withIdentifier: "detailVC") as? DetailViewController {
            viewController.hotelListObj = hotelObj
            self.navigationController?.pushViewController(viewController, animated: true)

        }
    }


}
