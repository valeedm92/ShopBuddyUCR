//
//  SearchVC.swift
//  ShopBuddy
//
//  Created by Darrin Lin on 11/8/14.
//  Copyright (c) 2014 Kenneth Hsu. All rights reserved.
//

import UIKit
import CoreLocation

class SearchVC: UIViewController, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    // IBOutlets
    @IBOutlet var productSearchBar: UISearchBar!
    @IBOutlet var locationSearchBar: UISearchBar!
    @IBOutlet var resultsTable: UITableView!
    
    // Optional variables
    var productSearchBarText: String = "default"
    var locationSearchBarText: String = "default"
    var gettingCurrentLocation: Bool = true
    var data: NSMutableData = NSMutableData()
    var currentBusiness: Business = Business()
    var currentIndex: Int = Int()
    var arrayOfResults: [Business] = [Business] ()
    
    // Location manager
    let locationManager = CLLocationManager()
    
    @IBAction func getCurrentLocation(sender: UIButton) {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        gettingCurrentLocation = true
    }
    
    func getCurrentLocation() {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        gettingCurrentLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // If default text has been modified, auto-search query from searchBarText
        if productSearchBarText != "default" {
            productSearchBar.text = productSearchBarText
        }
        // If current location has been obtained, update search location text
        if locationSearchBarText != "default" {
            locationSearchBar.text = locationSearchBarText
            // self.locationManager.startUpdatingLocation()
        }

        self.resultsTable.delegate = self
        self.resultsTable.dataSource = self
        resultsTable.reloadData()
        // self.setUpBusiness()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpBusiness() {
        println("Setup Business")
        
        var business1 = Business (logo: "100.jpg", catergory: "Gas Station", id: "1", name: "Bob", phoneNum: "###", address: "Addr", price87: "0.00", price89: "0.00", price91: "0.00", priceD: "0.00", timeLastUdpated: "0:00", userLastUpdated: "Joe", distance: "1.2")
        
        arrayOfResults.append(business1)
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.getCurrentLocation()
        searchBar.showsCancelButton = false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: ResultCell = tableView.dequeueReusableCellWithIdentifier("businessCell") as ResultCell
        let currentBusiness = arrayOfResults[indexPath.row]
        cell.setCell(currentBusiness.logo, price: currentBusiness.price87, time: currentBusiness.timeLastUpdated, user: currentBusiness.userLastUpdated, distance:  currentBusiness.distance)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfResults.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected custom cell #: " + String(format: "%i", indexPath.row))
        currentBusiness = arrayOfResults[indexPath.row]
    }
    // =======================================================================================================
    
    
    // MARK: - Location functions
    // ____________________________________________________________
    // Location Manager
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        if gettingCurrentLocation {
            CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error)->Void in
                if error != nil {
                    println("Reverse geocoder failed with error")
                    println("Error: " + error.localizedDescription)
                    return
                }
                
                if placemarks.count > 0 {
                    let pm = placemarks[0] as CLPlacemark
                    self.displayLocationInfo(pm, manager: manager)
                }
                else{
                    println("Error with data recv from geocoder")
                }
            })
        }
        else {
            // This function looks at the address put in the search bar and returns the latti and longi of said location
            CLGeocoder().geocodeAddressString(locationSearchBar.text, {(placemarks: [AnyObject]!, error: NSError!) -> Void in
                if let placemark = placemarks?[0] as? CLPlacemark {
                    let location = CLLocationCoordinate2D( latitude: placemark.location.coordinate.latitude, longitude: placemark.location.coordinate.longitude )
                    println(location.longitude);
                    println(location.latitude);
                }   // end of if
            })      // end of function call
        }
    }
    // ____________________________________________________________
    
    // Check for error while getting location
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error while trying to obtain location")
        println("Error " + error.localizedDescription)
    }
    // ____________________________________________________________
    
    // Function to show location info of a placemark
    func displayLocationInfo(placemark: CLPlacemark, manager: CLLocationManager) {
        // Stop updating location after location has been obtained (less battery strain)
        self.locationManager.stopUpdatingLocation()
        
        // Display location info
        println("City: " + placemark.locality)
        println("Zip Code: " + placemark.postalCode)
        println("State: " + placemark.administrativeArea)
        println("Country: " + placemark.country)
        
        // Assign location variable
        locationSearchBarText = String(placemark.locality as String + ", " + placemark.postalCode as String)
        queryLocationFromPHP(manager)
        resultsTable.reloadData()
        self.viewDidLoad()
    }
    
    func queryLocationFromPHP(manager: CLLocationManager) {
        // Formatting lati and long into NSStrings to send
        var lati: NSString = NSString(format: "%.10f", manager.location.coordinate.latitude)
        var long: NSString = NSString(format: "%.10f", manager.location.coordinate.longitude)
        var post: NSString = NSString(format: "lati=" + lati + "&long=" + long)                 // Post is what we send as input to server
        var url: NSURL = NSURL(string:"http://shopbuddyucr.com/nearbygas.php")!                 // URL of the PHP
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
                var bPrice87: String = responseData[i].objectForKey("Price87") as String
                var bPrice89: String = responseData[i].objectForKey("Price89") as String
                var bPrice91: String = responseData[i].objectForKey("Price91") as String
                var bPriceD: String = responseData[i].objectForKey("PriceD") as String
                var bTimeLastUpdated: String = responseData[i].objectForKey("TimeLastUpdated") as String
                var bUserLastUpdated: String = responseData[i].objectForKey("UserLastUpdated") as String
                var bDist: String = responseData[i].objectForKey("dist") as String
                
                var tmpBusiness = Business(logo: bLogo, catergory: bCat, id: bID, name: bName, phoneNum: bPhone, address: bAddress, price87: bPrice87, price89: bPrice89, price91: bPrice91, priceD: bPriceD, timeLastUdpated: bTimeLastUpdated, userLastUpdated: bUserLastUpdated, distance: bDist)
                print(i); print(": ")
                println("appending to arrayOfResults")
                arrayOfResults.append(tmpBusiness)
            }
        }
        
    }
    
    func updateLogo (businessName: String) -> String {
        if businessName == "7-Eleven" {
            return "genericGas.png"
        }
        else if businessName == "76" {
            return "76.jpg"
        }
        else if businessName == "Allsup's" {
            return "allsups.png"
        }
        else if businessName == "Arco" {
            return "arco.png"
        }
        else if businessName == "Cheveron" {
            return "chevron.jpg"
        }
        else if businessName == "Circle K" {
            return "circleK.png"
        }
        else if businessName == "Costco" {
            return "costco.jpg"
        }
        else if businessName == "Food4less" {
            return "food4less.png"
        }
        else if businessName == "Mobil" {
            return "mobil.jpg"
        }
        else if businessName == "Shell" {
            return "shell.jpg"
        }
        else if businessName == "Thrifty" {
            return "76.jpg"
        }
        else if businessName == "USA Gasoline" {
            return "genericGas.png"
        }
        else if businessName == "Weis Service Station" {
            return "westerGas.png"
        }
        else {
            return "genericGas.png"
        }
    }
    // =======================================================================================================

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
       
        if segue.identifier == "goto_Details" {
            println("going to Details")
            
//            var currentIndexPath = self.resultsTable.indexPathForCell(sender)
            var i: NSIndexPath = resultsTable.indexPathForSelectedRow()!
            currentBusiness = arrayOfResults[i.row]
            var detailViewReference: Details = segue.destinationViewController as Details
            detailViewReference.setCurrentBusiness(currentBusiness)
            detailViewReference.setPreviousVC(self)
            // detailViewReference.viewDidLoad()
        }
    }

}
