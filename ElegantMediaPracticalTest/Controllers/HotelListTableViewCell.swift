//
//  HotelListTableViewCell.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit
import SDWebImage

class HotelListTableViewCell: UITableViewCell {

    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var imgProfileImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        lblTitle.text = nil
        lblAddress.text = nil
        imgProfileImage.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //Set data to tableview
    func setData(data: listOfData) {
        lblTitle.text = data.title
        lblAddress.text = data.address
        imgProfileImage.sd_setImage(with: URL(string: data.image!.small)) { (_, _, _, _) in
            
        }
        
    }
    
}
