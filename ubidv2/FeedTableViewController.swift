//
//  FeedTableViewController.swift
//  ubidv2
//
//  Created by nicholas giacobbe on 12/2/22.
//

import UIKit
import Parse
class FeedTableViewController: UITableViewController {
    var posts = [PFObject]()
    let myRefreshControll = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFeed()
        myRefreshControll.addTarget(self, action: #selector(loadFeed), for: .valueChanged)
        self.tableView.rowHeight=UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 150
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as! FeedCell
        let post = posts[indexPath.row]
        cell.titleLable.text = post["title"] as? String
        let bid:Double = post["statingBid"] as! Double
        let bidStr = String(format: "%.2f", bid)
        cell.bidLabel.text = bidStr
        
        let currDate = Date()
        let endDate: Date = post["auctionTime"] as! Date
        let remainingTime: TimeInterval = endDate.timeIntervalSince(currDate);
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .short
        formatter.allowedUnits = [.hour, .minute]
        formatter.zeroFormattingBehavior = .pad

        let remainingString = formatter.string(from: remainingTime)
        cell.timeRemaining.text = remainingString
        
        
        
        
        
        
        
        
        
        let imageFile = post["image"] as! PFFileObject
                let urlString = imageFile.url!
                let url = URL(string: urlString)!
                cell.imageItem.af.setImage(withURL: url)
        return cell
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }
    override func viewDidAppear(_ animated: Bool) {
        self.loadFeed()
        
        
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detailSegue" {
                let cell = sender as! UITableViewCell
                let indexPath = tableView.indexPath(for: cell)!
                let post = posts[indexPath.row]
                let detailsViewController = segue.destination as! DetailsViewController
                detailsViewController.post = post
                tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    @objc func loadFeed(){
        let query = PFQuery(className: "items")
        query.whereKey("auctionOver", equalTo:false)
        query.limit = 20
        query.findObjectsInBackground{
            (posts, error) in
            if posts != nil{
                self.posts = posts!
                self.tableView.reloadData()
                
            }
        }
    }
    @IBAction func onCamera(_ sender: Any) {
        performSegue(withIdentifier: "camSeg", sender: sender)
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
                 let main = UIStoryboard(name: "Main", bundle: nil)
                 let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
                 guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
                 delegate.window?.rootViewController = loginViewController
    }
    
}
