//
//  FeedCell.swift
//  ubidv2
//
//  Created by nicholas giacobbe on 12/2/22.
//

import UIKit

class FeedCell: UITableViewCell {

    
    @IBOutlet weak var bidLabel: UILabel!
    
    
    @IBOutlet weak var timeRemaining: UILabel!
    
    @IBOutlet weak var titleLable: UILabel!
    
    

    
    
    @IBOutlet weak var imageItem: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
