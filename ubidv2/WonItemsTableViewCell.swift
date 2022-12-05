//
//  WonItemsTableViewCell.swift
//  ubidv2
//
//  Created by nicholas giacobbe on 12/4/22.
//

import UIKit

class WonItemsTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var highbidLabel: UILabel!
    @IBOutlet weak var cbidLabel: UILabel!
    @IBOutlet weak var itemimageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
