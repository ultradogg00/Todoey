//
//  CategoryViewController.swift
//  Todoey
//
//  Created by David Ashieze on 2019-01-11.
//  Copyright © 2019 David Ashieze. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    //Mark: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    

    
  //Mark: - Data Manipulation Methods
    
    // new categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
   
    
    
    //Mark: - TableView Delegate Methods
    
   
    
    
    
    
}
