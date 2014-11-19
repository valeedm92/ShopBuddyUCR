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
        arrayOfProducts.append(Product(category: "Gas", productName: ""))
        arrayOfProducts.append(Product(category: "Gas", productName: "Regular Gas"))
        arrayOfProducts.append(Product(category: "Gas", productName: "Mid-grade Gas"))
        arrayOfProducts.append(Product(category: "Gas", productName: "Diesel Gas"))
        
        arrayOfProducts.append(Product(category: "Fruit", productName: ""))
        arrayOfProducts.append(Product(category: "Fruit", productName: "Apple"))
        arrayOfProducts.append(Product(category: "Fruit", productName: "Orange"))
        arrayOfProducts.append(Product(category: "Fruit", productName: "Banana"))
        arrayOfProducts.append(Product(category: "Fruit", productName: "Watermelon"))
        
        arrayOfProducts.append(Product(category: "Electronic", productName: ""))
        arrayOfProducts.append(Product(category: "Electronic", productName: "iPhone 6"))
        arrayOfProducts.append(Product(category: "Electronic", productName: "iPad Air 2"))
        arrayOfProducts.append(Product(category: "Electronic", productName: "Lightning Cable"))
        arrayOfProducts.append(Product(category: "Electronic", productName: "AirPort Express"))
    
        arrayOfProducts.append(Product(category: "Beverage", productName: ""))
        arrayOfProducts.append(Product(category: "Beverage", productName: "Coca-Cola"))
        arrayOfProducts.append(Product(category: "Beverage", productName: "Bud Light"))
        arrayOfProducts.append(Product(category: "Beverage", productName: "Water"))
        arrayOfProducts.append(Product(category: "Beverage", productName: "Orange Juice"))

        arrayOfProducts.append(Product(category: "Cleaning", productName: ""))
        arrayOfProducts.append(Product(category: "Cleaning", productName: "Windex"))
        arrayOfProducts.append(Product(category: "Cleaning", productName: "Clorex"))

        arrayOfProducts.append(Product(category: "Cloth", productName: ""))
        arrayOfProducts.append(Product(category: "Cloth", productName: "T-Shirt"))
        arrayOfProducts.append(Product(category: "Cloth", productName: "Jeans"))
        arrayOfProducts.append(Product(category: "Cloth", productName: "Swimsuit"))
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
