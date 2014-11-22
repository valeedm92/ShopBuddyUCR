//
//  Business.swift
//  ShopBuddy
//
//  Created by Kenneth Hsu on 10/31/14.
//  Copyright (c) 2014 Kenneth Hsu. All rights reserved.
//

import Foundation

class Business {
    
    var logo: String
    var category: String
    var id: String
    var name: String
    var phoneNum: String
    var address: String
    var listOfProducts: [Product]
    var url: NSURL = NSURL(string: "http://shopbuddyucr.com/GetItems.php")!
    
    /* THESE ARE NOW A PART OF PRODUCTS
    var price87: String
    var price89: String
    var price91: String
    var priceD: String
    var timeLastUpdated: String
    var userLastUpdated: String
    */
    
    var distance: String
    
    init () {
        self.logo = "100.jpg"
        self.category = "category"
        self.id = "-1"
        self.name = "businessName"
        self.phoneNum = "5555555555"
        self.address = "0 DoesNotExist St., NoCity, NoState"
        self.distance = "0.0"
        self.listOfProducts = [Product]()
    }
    
    init (logo: String, catergory: String, id: String, name: String, phoneNum: String, address: String, distance: String) {
        self.logo = logo
        self.category = catergory
        self.id = id
        self.name = name
        self.phoneNum = phoneNum
        self.address = address
        self.distance = distance
        self.listOfProducts = [Product]()//queryProductsFromDB(id, dbURL: url)
    }
    
    /*
    func queryProductsFromDB (businessID: String, dbURL: NSURL) -> [Product] {
        var post: NSString = NSString(format: "StoreID=" + businessID)                              // Post is what we send as input to server
        var url: NSURL = dbURL                                                                      // URL of the PHP
        var postData: NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
        var postLength: NSString = String( postData.length )
        var request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue(postLength, forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        var reponseError: NSError?
        var response: NSURLResponse?
        var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
        
        if (urlData != nil) {
            //  Use this to print responseData to console
            //  var responseData:NSString = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
            //  NSLog("Response ==> %@", responseData);
            var error:NSError?
            var responseData: NSArray = NSJSONSerialization.JSONObjectWithData(urlData!, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSArray
            println("before for loop")
            for var i = 0; i < responseData.count; i++ {
                var bLogo: String = "100.jpg"
                var bCat: String = "Gas Station" as String
                var bID: String = responseData[i].objectForKey("ID") as String
                var bName: String = responseData[i].objectForKey("Name") as String
                bLogo = updateLogo(bName)
                var bPhone: String = responseData[i].objectForKey("PhoneNumber") as String
                var bAddress: String = responseData[i].objectForKey("Address") as String
                var bDist: String = responseData[i].objectForKey("dist") as String
                
                /* THESE ARE NOW PART OF PRODUCTS
                // var bPrice87: String = responseData[i].objectForKey("Price87") as String
                // var bPrice89: String = responseData[i].objectForKey("Price89") as String
                // var bPrice91: String = responseData[i].objectForKey("Price91") as String
                // var bPriceD: String = responseData[i].objectForKey("PriceD") as String
                // var bTimeLastUpdated: String = responseData[i].objectForKey("TimeLastUpdated") as String
                // var bUserLastUpdated: String = responseData[i].objectForKey("UserLastUpdated") as String
                */
                
                // queryPHPForProducts()
                // tmpBusiness.products = tmpProducts
                var tmpBusiness = Business(logo: bLogo, catergory: bCat, id: bID, name: bName, phoneNum: bPhone, address: bAddress, distance: bDist)
                print(i); print(": ")
                println("appending to arrayOfResults")
                arrayOfResults.append(tmpBusiness)
            }
        }

    }
    */
}