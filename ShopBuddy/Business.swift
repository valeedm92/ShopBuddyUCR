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
    var price87: String
    var price89: String
    var price91: String
    var priceD: String
    var timeLastUpdated: String
    var userLastUpdated: String
    var distance: String
    
    init () {
        self.logo = "100.jpg"
        self.category = "category"
        self.id = "-1"
        self.name = "businessName"
        self.phoneNum = "5555555555"
        self.address = "0 DoesNotExist St., NoCity, NoState"
        self.price87 = "0.00"
        self.price89 = "0.00"
        self.price91 = "0.00"
        self.priceD = "0.00"
        self.timeLastUpdated = "23:59"
        self.userLastUpdated = "username"
        self.distance = "0.0"
    }
    
    init (logo: String, catergory: String, id: String, name: String, phoneNum: String, address: String, price87: String, price89: String, price91: String, priceD: String, timeLastUdpated: String, userLastUpdated: String, distance: String) {
        self.logo = logo
        self.category = catergory
        self.id = id
        self.name = name
        self.phoneNum = phoneNum
        self.address = address
        self.price87 = price87
        self.price89 = price89
        self.price91 = price91
        self.priceD = priceD
        self.timeLastUpdated = timeLastUdpated
        self.userLastUpdated = userLastUpdated
        self.distance = distance
    }
    
}