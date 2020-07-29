//
//  DetailViewController.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imgProfileImage: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var txtDescription: UITextView!

    var hotelListObj: listOfData?

    override func viewDidLoad() {
        super.viewDidLoad()
        imgProfileImage.sd_setImage(with: URL(string: (hotelListObj?.image?.small)!), completed: nil)
        lblTitle.text = hotelListObj?.title
        txtDescription.text = hotelListObj?.description

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_map"), style: .plain, target: self, action: #selector(addTapped))

    }

    @objc func addTapped() {
         let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
               if let viewController = mainStoryboard.instantiateViewController(
                   withIdentifier: "mapVC") as? MapViewController {
                viewController.hotelListObj = hotelListObj
                   self.navigationController?.pushViewController(viewController, animated: true)

               }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
