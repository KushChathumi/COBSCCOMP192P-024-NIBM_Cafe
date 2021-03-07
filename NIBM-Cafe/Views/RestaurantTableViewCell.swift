//
//  RestaurantTableViewCell.swift
//  NIBM-Cafe
//
//  Created by Kushani Abeysinghe on 2021-03-07.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    @IBOutlet weak var foodPlace: UILabel!
    @IBOutlet weak var foodPrice:UILabel!
    @IBOutlet weak var distance:UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
