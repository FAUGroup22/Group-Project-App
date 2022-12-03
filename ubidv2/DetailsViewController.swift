//
//  DetailsViewController.swift
//  ubidv2
//
//  Created by nicholas giacobbe on 12/3/22.
//

import UIKit
import Parse
class DetailsViewController: UIViewController {
    var post: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ti.text = post["title"] as? String
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ti: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
