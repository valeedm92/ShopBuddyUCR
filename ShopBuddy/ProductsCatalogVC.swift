//
//  ProductsCatalogVC.swift
//  ShopBuddy
//
//  Created by Kenneth Hsu on 11/17/14.
//  Copyright (c) 2014 Fancy. All rights reserved.
//

import UIKit

class ProductsCatalogVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var catalogTable: UITableView!
    
    var previousVC: ShoppingListVC = ShoppingListVC()
    var arrayOfProducts = [Product] ()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.catalogTable.delegate = self
        self.catalogTable.dataSource = self
        
        loadCatalog()
        
        catalogTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: ProductCell = tableView.dequeueReusableCellWithIdentifier("catalogItem") as ProductCell
        let currentProduct = arrayOfProducts[indexPath.row]
        cell.setCell(currentProduct.category, productName: currentProduct.productName, isProduct:currentProduct.isProduct)
        if !currentProduct.isProduct {
            cell.backgroundColor = UIColor.grayColor()
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfProducts.count
    }
    
    @IBAction func cancelTriggered(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println("You selected custom cell #: " + String(format: "%i", indexPath.row))
        if arrayOfProducts[indexPath.row].isProduct {
            previousVC.queryText = arrayOfProducts[indexPath.row].productName
            println(previousVC.queryText)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func setPrevVC (prevVC: ShoppingListVC) {
        previousVC = prevVC
    }

    func loadCatalog () {
        arrayOfProducts.append(Product(category: "Gas", productName: "", isProduct: false))
        arrayOfProducts.append(Product(category: "Gas", productName: "Regular Gas", isProduct: true))
        arrayOfProducts.append(Product(category: "Gas", productName: "Mid-grade Gas", isProduct: true))
        arrayOfProducts.append(Product(category: "Gas", productName: "Diesel Gas", isProduct: true))
        
        arrayOfProducts.append(Product(category: "Fruit", productName: "", isProduct: false))
        arrayOfProducts.append(Product(category: "Fruit", productName: "Apple", isProduct: true))
        arrayOfProducts.append(Product(category: "Fruit", productName: "Orange", isProduct: true))
        arrayOfProducts.append(Product(category: "Fruit", productName: "Banana", isProduct: true))
        arrayOfProducts.append(Product(category: "Fruit", productName: "Watermelon", isProduct: true))
        
        arrayOfProducts.append(Product(category: "Electronic", productName: "", isProduct: false))
        arrayOfProducts.append(Product(category: "Electronic", productName: "iPhone 6", isProduct: true))
        arrayOfProducts.append(Product(category: "Electronic", productName: "iPad Air 2", isProduct: true))
        arrayOfProducts.append(Product(category: "Electronic", productName: "Lightning Cable", isProduct: true))
        arrayOfProducts.append(Product(category: "Electronic", productName: "AirPort Express", isProduct: true))
    
        arrayOfProducts.append(Product(category: "Beverage", productName: "", isProduct: false))
        arrayOfProducts.append(Product(category: "Beverage", productName: "Coca-Cola", isProduct: true))
        arrayOfProducts.append(Product(category: "Beverage", productName: "Bud Light", isProduct: true))
        arrayOfProducts.append(Product(category: "Beverage", productName: "Water", isProduct: true))
        arrayOfProducts.append(Product(category: "Beverage", productName: "Orange Juice", isProduct: true))

        arrayOfProducts.append(Product(category: "Cleaning", productName: "", isProduct: false))
        arrayOfProducts.append(Product(category: "Cleaning", productName: "Windex", isProduct: true))
        arrayOfProducts.append(Product(category: "Cleaning", productName: "Clorex", isProduct: true))

        arrayOfProducts.append(Product(category: "Cloth", productName: "", isProduct: false))
        arrayOfProducts.append(Product(category: "Cloth", productName: "T-Shirt", isProduct: true))
        arrayOfProducts.append(Product(category: "Cloth", productName: "Jeans", isProduct: true))
        arrayOfProducts.append(Product(category: "Cloth", productName: "Swimsuit", isProduct: true))
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
