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
This is an app that will allow people to bid on items they would like to own.  You will also be able to post your own items for auction. 

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:**
- **Mobile:**
- **Story:**
- **Market:**
- **Habit:**
- **Scope:**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* The user will be able to see the app icon on the home screen and see the logo during the load screen
* The user can create an account
* The user can sign into a pre-exisiting account
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
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
