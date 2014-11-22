//
//  Product.swift
//  ShopBuddy
//
//  Created by Kenneth Hsu on 11/17/14.
//  Copyright (c) 2014 Fancy. All rights reserved.
//

import Foundation

class Product {
    
    var category: String
    // var productID: String
    // var businessID: String
    var productName: String
    // var price: String
    // var timeLastUpdated: String
    // var userLastUpdated: String
    var isProduct: Bool
    
    init () {
        self.category = "Default Catagory Name"
        self.productName = "Default Product Name"
        self.isProduct = false
    }
    
    init (category: String, productName: String) {
        self.category = category
        self.productName = productName
        if (self.productName == "") {
            isProduct = false
        }
        else {
            isProduct = true
        }
    }
    
    init (category: String, productName: String, isProduct: Bool) {
        self.category = category
        self.productName = productName
        self.isProduct = isProduct
    }
}