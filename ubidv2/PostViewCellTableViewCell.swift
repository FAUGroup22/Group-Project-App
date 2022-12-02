//
//  PostViewCellTableViewCell.swift
//  ubidv2
//
//  Created by Garrett Bell on 12/1/22.
//

import UIKit

class PostViewCellTableViewCell: UITableViewCell {

   
    @IBOutlet weak var itempictureView: UIImageView!
    @IBOutlet weak var itemtitleLabel: UILabel!
    @IBOutlet weak var itembidLabel: UILabel!
    @IBOutlet weak var bidvalueLabel: UILabel!
    @IBOutlet weak var timeleftLabel: UILabel!
    @IBOutlet weak var timevalueLabel: UILabel!
    @IBOutlet weak var itemdescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
