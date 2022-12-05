//
//  MyItemsTableViewCell.swift
//  ubidv2
//
//  Created by nicholas giacobbe on 12/4/22.
//

import UIKit

class MyItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var hbidLabel: UILabel!
    @IBOutlet weak var timeleftLabel: UILabel!
    @IBOutlet weak var currentBidLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
