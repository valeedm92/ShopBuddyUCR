//
//  ResultDetailVC.swift
//  ShopBuddy
//
//  Created by Darrin Lin on 11/11/14.
//  Copyright (c) 2014 Kenneth Hsu. All rights reserved.
//

import UIKit

class ResultDetailVC: UIViewController {
    
    @IBOutlet var storeLogo: UIImageView!
    @IBOutlet var storeName: UILabel!
    @IBOutlet var storeAddress: UILabel!
    @IBOutlet var storePhoneNum: UILabel!
    
    /*
    // Business info
    @IBOutlet var logo: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var phoneNum: UILabel!
    
    // Price labels
    @IBOutlet var priceReg: UITextField!
    @IBOutlet var priceMid: UITextField!
    @IBOutlet var pricePre: UITextField!
    @IBOutlet var priceDie: UITextField!
    
    // Last updated time
    @IBOutlet var regUpdateTime: UILabel!
    @IBOutlet var midUpdateTime: UILabel!
    @IBOutlet var preUpdateTime: UILabel!
    @IBOutlet var dieUpdateTime: UILabel!
    */
    
    var businessInfo: Business = Business()
    
    override func viewDidLoad() {
        // Request info here and update details
        super.viewDidLoad()
        
        storeName.text = "hello"
        
        // Load UI
        // self.updateLabels()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCurrentBusiness(currrentBusiness: Business) {
        businessInfo = currrentBusiness
    }
    
    /*
    func updateLabels () {
        println(name.text)
        /*
        logo.image = UIImage(named: businessInfo.logo)
        name.text = businessInfo.name
        address.text = businessInfo.address
        phoneNum.text = businessInfo.phoneNum
        priceReg.text = businessInfo.price87
        priceMid.text = businessInfo.price89
        pricePre.text = businessInfo.price91
        priceDie.text = businessInfo.priceD
        regUpdateTime.text = businessInfo.timeLastUpdated
        midUpdateTime.text = businessInfo.timeLastUpdated
        preUpdateTime.text = businessInfo.timeLastUpdated
        dieUpdateTime.text = businessInfo.timeLastUpdated
        */
    }
*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
