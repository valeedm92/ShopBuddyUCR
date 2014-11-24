//
//  Product.swift
//  ShopBuddy
//
//  Created by Kenneth Hsu on 11/17/14.
//  Copyright (c) 2014 Fancy. All rights reserved.
//

import Foundation

class Product {
    
    var productID: String
    var businessID: String
    var category: String
    var productName: String
    var productPrice: String
    var timeLastUpdated: String
    var userLastUpdated: String
    var isProduct: Bool
    
    init () {
        self.productID = "-1"
        self.businessID = "-1"
        self.category = "Default Catagory Name"
        self.productName = "Default Product Name"
        self.productPrice = "0.00"
        self.timeLastUpdated = "0 minutes ago"
        self.userLastUpdated = "DefaultUser"
        self.isProduct = false
    }
    
    init (category: String, productName: String) {
        self.productID = "n/a"
        self.businessID = "n/a"
        self.category = category
        self.productName = productName
            if (self.productName == "") {
                isProduct = false
            }
            else {
                isProduct = true
            }
        self.productPrice = "n/a"
        self.timeLastUpdated = "n/a"
        self.userLastUpdated = "System"
    }
    
    init (category: String, productName: String, isProduct: Bool) {
        self.productID = "-1"
        self.businessID = "-1"
        self.category = category
        self.productName = productName
        self.productPrice = "0.00"
        self.timeLastUpdated = "0 minutes ago"
        self.userLastUpdated = "DefaultUser"
        self.isProduct = isProduct
    }
    
    init (pID: String, bID: String, category: String, productName: String, price: String, time: String, user: String, isProduct: Bool) {
        self.productID = pID
        self.businessID = bID
        self.category = category
        self.productName = productName
        self.productPrice = price
        self.timeLastUpdated = time
        self.userLastUpdated = user
        self.isProduct = isProduct
    }
    
    // Goes thru each business and tried to find the business that "self" (aka this product) belongs to.
    func getBusiness(listOfBusinesses: [Business]) -> Business {
        for var i = 0; i < listOfBusinesses.count; i++ {
            if self.businessID == listOfBusinesses[i].id {
                // Business has been found, return the business
                println("Business: " + listOfBusinesses[i].name + " found")
                return listOfBusinesses[i]
            }
        }
        
        println("Business with matching ID was not found, returning default business...")
        return Business()
    }
}