//
//  WonItemsTableViewController.swift
//  ubidv2
//
//  Created by nicholas giacobbe on 12/4/22.
//

import UIKit
import Parse
class WonItemsTableViewController: UITableViewController {

    var posts = [PFObject]()
    let myRefreshControll = UIRefreshControl()
    override func viewDidLoad() {
        loadFeed()
        super.viewDidLoad()
        myRefreshControll.addTarget(self, action: #selector(loadFeed), for: .valueChanged)
        tableView.refreshControl=myRefreshControll
        self.tableView.rowHeight=UITableView.automaticDimension
        self.tableView.rowHeight = 155
        
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wonCell", for: indexPath) as! WonItemsTableViewCell
        let post = posts[indexPath.row]
        cell.titleLabel.text = post["title"] as? String
        // Configure the cell...
        let bid:Double = post["statingBid"] as! Double
        let bidStr = String(format: "$%.2f", bid)
        cell.cbidLabel.text = bidStr
        
        

        let imageFile = post["image"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
          cell.itemimageView.af.setImage(withURL: url)
        
        return cell
    }
        

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    */
    
    @objc func loadFeed(){
        self.posts.removeAll()
        let query1 = PFQuery(className: "items")
        query1.whereKey("auctionOver", equalTo:true)
        let query2 = PFQuery(className: "items")
        query2.whereKey("highBidderId", equalTo: PFUser.current()!)
        let query = PFQuery.orQuery(withSubqueries: [query1, query2])
        query.limit = 20
        query.findObjectsInBackground{
            (posts, error) in
            if posts != nil{
                self.posts = posts!
                self.tableView.reloadData()
                self.myRefreshControll.endRefreshing()
            }
        }
    }
}
