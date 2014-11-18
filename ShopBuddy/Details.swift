//
//  Details.swift
//  ShopBuddy
//
//  Created by Darrin Lin on 11/12/14.
//  Copyright (c) 2014 Kenneth Hsu. All rights reserved.
//

import UIKit

class Details: UIViewController {

    @IBOutlet var storeName: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var phoneNum: UILabel!
    @IBOutlet var regular: UITextField!
    @IBOutlet var midgrade: UITextField!
    @IBOutlet var premium: UITextField!
    @IBOutlet var diesel: UITextField!
    @IBOutlet var image: UIImageView!
    var businessID: String = ""
    var currentBusiness: Business = Business()
    
    @IBAction func updatePrices(sender: AnyObject) {
        currentBusiness.price87 = regular.text
        currentBusiness.price89 = midgrade.text
        currentBusiness.price91 = premium.text
        currentBusiness.priceD = diesel.text
        sendPricesToPHP()
    }
    
    @IBAction func doneTriggered(sender: AnyObject) {
        println("going back to results")
        self.dismissViewControllerAnimated(true, completion: nil)
        previousVC.viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setLabels()
//        self.navigationController?.navigationBarHidden = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setCurrentBusiness (currBusiness: Business) {
        currentBusiness = currBusiness
    }
    
    func setLabels () {
        businessID = currentBusiness.id
        storeName.text = currentBusiness.name
        address.text = currentBusiness.address
        phoneNum.text = currentBusiness.phoneNum
        regular.text = currentBusiness.price87
        midgrade.text = currentBusiness.price89
        premium.text = currentBusiness.price91
        diesel.text = currentBusiness.priceD
        image.image = UIImage(named: currentBusiness.logo)
    }
    
    func sendPricesToPHP() {
        // Formatting lati and long into NSStrings to send
        var id: NSString = businessID
        var price87: NSString = NSString(format: regular.text)
        var price89: NSString = NSString(format: midgrade.text)
        var price91: NSString = NSString(format: premium.text)
        var priceD: NSString = NSString(format: diesel.text)
        
        var post: NSString = NSString(format: "ID=" + id + "&Price87=" + price87 + "&Price89=" + price89 + "&Price91=" + price91 + "&PriceD=" + priceD)
        println(post)
        
        var url: NSURL = NSURL(string:"http://shopbuddyucr.com/submitprices.php")!                 // URL of the PHP
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
            var responseData:NSString = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
            NSLog("Response ==> %@", responseData);
        }
    }
    
    var previousVC: SearchVC = SearchVC()
    func setPreviousVC(prevVC: SearchVC) {
        previousVC = prevVC
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
