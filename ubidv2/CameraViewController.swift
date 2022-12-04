//
//  CameraViewController.swift
//  ubidv2
//
//  Created by nicholas giacobbe on 11/29/22.
//

import UIKit
import AlamofireImage
import Parse
class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var auctionTime = 10080
    var highBidder = 0
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bidTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        /*if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }
        else{
            picker.sourceType = .photoLibrary
        }*/
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageAspectScaled(toFill: size)
        imageView.image = scaledImage
        dismiss(animated: true, completion: nil)
        
    }
    

    @IBAction func auctionsegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            auctionTime = 10080
        }
        else if sender.selectedSegmentIndex == 1{
            auctionTime = 4320
        }
        else if sender.selectedSegmentIndex == 2{
            auctionTime = 3
        }
        
    }
    
    
    @IBAction func onSubmitButton(_ sender: Any) {
        let post = PFObject(className: "items")
        post["description"] = descriptionTextView.text
        post["title"] = titleTextField.text
        let bid: Double? = Double(bidTextField.text!)
        post["statingBid"] = bid
        post["highestBid"] = bid
        post["auctionTime"] = Date().addingTimeInterval(TimeInterval(auctionTime*60))
        post["highbidderId"] = highBidder
        post["author"] = PFUser.current()!
        post["auctionOver"] = false
        let imageData = imageView.image!.pngData()!
        let file = PFFileObject(data: imageData)
        post["image"] = file
        post.saveInBackground{
            (success, error) in
            if success{
                print("saved!")
                self.dismiss(animated: true, completion: nil)
                
            }
            else{
                print("error")
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
