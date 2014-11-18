//
//  ShoppingListVC.swift
//  ShopBuddy
//
//  Created by Kenneth Hsu on 11/17/14.
//  Copyright (c) 2014 Fancy. All rights reserved.
//

import UIKit

class ShoppingListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var shoppingListTable: UITableView!
    
    var arrayOfShoppingItems: [String] = [String] ()
    var queryText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.shoppingListTable.delegate = self
        self.shoppingListTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("shoppingItem") as UITableViewCell
        let currentItem = arrayOfShoppingItems[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfShoppingItems.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected custom cell #: " + String(format: "%i", indexPath.row))
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "goto_productsCatalog" {
            var nextVC: ProductsCatalogVC = segue.destinationViewController as ProductsCatalogVC
            nextVC.setPrevVC(self)
        }
    }

}
