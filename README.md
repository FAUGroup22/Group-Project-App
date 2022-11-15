Original App Design Project - README Template
===

# UBID
# By: Nicholas Giacobbe and Garrett Bell

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This is an app that will allow people to bid on items they would like to own.

Updated Walkthrough:
<img src='http://g.recordit.co/WogDpKQb6Q.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />




### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Entertainment/Lifestyle
- **Mobile:** This app will primarily be for mobile use only. 
- **Story:** Lets users post items up for auction.  Users will also be able to purchase items that are up for sale.
- **Market:** Any indiviual that would like to post an item for sale, or anyone looking to purchase anything people are putting up for sale.
- **Habit:** This app could be used often or not so often.  Whenever someone would like to see if any items they need or would like to have are up for auction.
- **Scope:** First we need to post some items up for sale and once we get enough poeple signed up and posting items, we can look at partnering with biggers social media apps.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* The user will be able to see the app icon on the home screen and see the logo during the load screen (Completed)
* The user can create an account (Completed)
* The user can sign into a pre-exisiting account (Completed)
* The user can see live auctions
* The user can click a specific auction and make bid 
* The user can post items for auction
* The user can see what items they have won
* The user can pay for items through an api
* The user can edit items 

**Optional Nice-to-have Stories**

* User can view their profile of recently bidded items
*  The user can view passed bids

### 2. Screen Archetypes

* Login Screen
   * User can sign in to account
   * User can create a new account
* Home Screen
   * This will be the main screen where the user can see all the live posted auctions
   * The user will be able to click on a specific item to bid on
 * Bid Screen
     * The user will be able to actively bid on an item of their choice
* Post Screen
    * The user can post and item for auction, set the price of the item, and time limit. This will be reused to edit items. 
* Purchased Screen
    * The user will be able to see which items they have won with the highest bid and will be able to hit a pay now button that will bring up a payment api.
* Items Screen
    * The user will be able to see what items they have posted.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home tab
* Auction tab
* Post Tab
* Purchased Tab

**Flow Navigation** (Screen to Screen)

* LogIn Screen to Home Screen
   * When the user opens the app they will be presented with the login screen.  Once they sign into an account they will be taken to the home screen.
  
* Home Screen to Bid Screen
   * Once the user is on the home screen where they can see the different live items up for auction. Once the user clicks on an item they will be presented to the item's bid screen.
 * Bid Screen back to Home Screen
     * Once the user wants to go back to the home screen, there will be a back button to click going back to the home sreen.
* Home Screen to Post Screen
    * The user can click on a button to post an item for auction. 
* Post Screen back to Home Screen
    * Once the users posts and item for auctions, they will be brought back to the home screen.  The user will also be able to leave the post screen without posting something. 

* Home Screen to Purchases Screen
    * User will click the tab bar button labeled purchased Items. This will bring the user to a page that will display which items they haved purchased. A pay now item will bring up a payment api outside the app. 

* Home Screen to My Items
    * User will click the tab bar button labeled My Items. This will bring the user to a page that will display which items they haved uploaded for auction.

* My Items to Post Screen 
    * User will click edit button on item that will bring up post screen with filled out information for user to edit.

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://i.imgur.com/d5tGTpK.png" width=600>

### [BONUS] Digital Wireframes & Mockups
https://www.figma.com/file/8DdSqyvbw17NXdppMqA5SX/Untitled?node-id=1%3A3

### [BONUS] Interactive Prototype


## Schema 
### Models
**Post**


| Property | Type     | description|
| -------- | -------- | -------- |
| objectID | String   | unique id for the users post   |
| author   | Pointer to user | user who posts an item|
| image    | File            | image of item to user post                      |
| description | string       | description of item by user
|startPrice|Integer | staring bid price set by user |
|createdTime |DateTime|time the user posted the item |
|updatedTime |DateTime |time the auction bid was updated |
### Networking
- [Add list of network requests by screen ]
- Login Screen
    - (Read/GET) Query logged in user object
    - (Create/Post) Create a new user object
- Home Screen
    - (Read/GET) Query all auction item objects where auction is active
- Bid Screen
    - (Update/PUT) Update selected auction item object for current high bid and bidder
- Post Screen
    - (Create/Post) Create a new auction item object
    - (Update/PUT) Update selected auction item object(edit functionality)
- Purchased Screen
    -  (Read/GET) Query all auction item objects where user won.
- Items Screen
    - (Read/GET) Query all auction item objects where user created them. 
- [Create basic snippets for each Parse network request]
- Login Screen
    - Sign In
```
        - ` @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password){
            (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
```
- Sign Up
```
        - `**@IBAction**   **func**   onSignUp(_ sender: **Any**) {

  **let** user = PFUser()

  user.username = usernameField.text

  user.password = passwordField.text

  user.signUpInBackground{

  (success, error) **in**

  **if** success{

  **self**.performSegue(withIdentifier: "loginSegue", sender: **nil**)

  }

  **else**{

  print("Error: \\(String(describing: error?.localizedDescription))")

  }

  }

  }
```
- Home Screen
    - query all the Auction Item Objects
```
        - `let query = PFQuery(className: "Items")
        query.includeKeys(["author", "id"])
        query.limit = 20
        query.findObjectsInBackground{
            (posts, error) in
            if posts != nil{
                self.posts = posts!
                self.tableView.reloadData()
```
- Bid Screen
    - Update selected auction item object for current high bid and bidder
```
        - `PFQuery *query = [PFQuery queryWithClassName:@"items"];

// Retrieve the object by id
[query getObjectInBackgroundWithId:@"xWMyZ4YEGZ"
                             block:^(PFObject *Items, NSError *error) {
    // Now let's update it with some new data. In this case, only cheatMode and score
    .
    items[@"highbidder"] = currentUser;
    items[@"highBid"] = @bid;
    [items saveInBackground];
}];`
```
- Post Screen
    - Create New auction Item
```
        - **let** post = PFObject(className: "Posts")

  post\["bid"\] = bidView.text
  post\["description"\] = descritpionView.text
  post\["title"\] = titleView.text
  post\["author"\] = PFUser.current()!

  **let** imageData = imageView.image!.pngData()!

  **let** file = PFFileObject(data: imageData)

  post\["image"\] = file

  post.saveInBackground{

  (success, error) **in**

  **if** success{

  print("saved!")

  **self**.dismiss(animated: **true**, completion: **nil**)

  }

  **else**{

  print("error")

  }

  }

  }
```

   - Update Auction Item
```
        - `PFQuery *query = [PFQuery queryWithClassName:@"items"];

// Retrieve the object by id
[query getObjectInBackgroundWithId:@"xWMyZ4YEGZ"
                             block:^(PFObject *Items, NSError *error) {
    // Now let's update it with some new data. In this case, only cheatMode and score
    .
    items[@"title"] = newTitle;
    items[@"description"] = newDescription;
    items[@"title"] = newTitle;
    let** imageData = imageView.image!.pngData()!

  **let** file = PFFileObject(data: imageData)
  //bid will not be able to be updated
    [items saveInBackground];
}];`
```
- Purchased Screen
    - Query all auction item objects where user won.
```
  - `let query = PFQuery(className:"Items")
query.whereKey("winner", equalTo: currentUser)
query.order(byDescending: "createdAt")
query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
   if let error = error {
      print(error.localizedDescription)
   } else if let posts = posts {
      print("Successfully retrieved \(posts.count) posts.")
      // TODO: Do something with posts...
   }
}`
```
- Items Screen
    - Query all auction item objects where user created them.
```
        - `
let query = PFQuery(className:"Items")
query.whereKey("author", equalTo: currentUser)
query.order(byDescending: "createdAt")
query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
   if let error = error {
      print(error.localizedDescription)
   } else if let posts = posts {
      print("Successfully retrieved \(posts.count) posts.")
      // TODO: Do something with posts...
   }
}`
```

`

    
    `
