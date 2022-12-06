//
//  DetailsViewController.swift
//  ubidv2
//
//  Created by nicholas giacobbe on 12/3/22.
//

import UIKit
import Parse
import SwiftUI
import AlamofireImage
class DetailsViewController: UIViewController {
    var post: PFObject!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ti.text = post["title"] as? String
        // Do any additional setup after loading the view.
       let imageFile = post["image"] as! PFFileObject
                let urlString = imageFile.url!
                let url = URL(string: urlString)!
        itemImageView.af.setImage(withURL: url)
        
        let bid:Double = post["statingBid"] as! Double
        let bidStr = String(format: "$%.2f", bid)
        currentBidLabel.text = bidStr
        let nextBid:Double = bid*1.05
        let nextBidStr = String(format: "$%.2f",nextBid)
        NextBid.text = nextBidStr 
        
        let currDate = Date()
        let endDate: Date = post["auctionTime"] as! Date
        let remainingTime: TimeInterval = endDate.timeIntervalSince(currDate);
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .short
        formatter.allowedUnits = [.hour, .minute]
        formatter.zeroFormattingBehavior = .pad

        let remainingString = formatter.string(from: remainingTime)
        countdownLabel.text = remainingString
        
        descriptionLabel.text = post["description"] as? String
        
        

       
    }
    
    @IBOutlet weak var ti: UILabel!
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var hbidLabel: UILabel!
    
    @IBOutlet weak var timeleftLabel: UILabel!
    
    @IBOutlet weak var NextBid: UILabel!
    @IBOutlet weak var currentBidLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    
    @IBAction func bidButton(_ sender: Any) {
        //Declare Alert Message
        let dialogMessage = UIAlertController(title: "Confirm Bid", message: "Are you sure your would like to place bid?", preferredStyle: .alert)
        
        //Create Confirm button with action handler
        let confirm = UIAlertAction(title: "Yes", style: .default, handler:
                { (action) ->Void in
            print("The confirm button was pressed")
            self.confirmBid()
        })
        
        //Create Cancel Button with action handler
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("The cancel button was pressed")
            
        }
        
        //Add Confirm and Cancel Button to Dialog message
        dialogMessage.addAction(confirm)
        dialogMessage.addAction(cancel)
        
        //Present the dialog box to user
        self.present(dialogMessage, animated: true, completion: nil)
    
    }
    
    func confirmBid(){
        let bid:Double = post["statingBid"] as! Double
        let newBid = 1.05 * bid
        let bidStr = String(format: "$%.2f", newBid)
        let nextBid = 1.05 * newBid
        let nextBidStr = String(format: "$%.2f", nextBid)
        currentBidLabel.text = bidStr
        NextBid.text = nextBidStr
        //post.add(newBid, forKey: "statingBid")
        
        post.setObject(PFUser.current()!, forKey: "highbidderId")
        post.setObject(newBid, forKey: "statingBid")
        post.saveInBackground { (success, error) in
            if success {
                print("Bid updated")
            }
            else {
                print("Error updating Bid")
            }
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
