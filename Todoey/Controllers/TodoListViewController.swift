//
//  ViewController.swift
//  Todoey
//
//  Created by David Ashieze on 2018-12-14.
//  Copyright © 2018 David Ashieze. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var iteamArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "kym"
        newItem.done = true
        iteamArray.append(newItem)
        
        
        let newItem2 = Item()
        newItem.done = true
        newItem2.title = "punch Dave"
        iteamArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "dab"
        iteamArray.append(newItem3)
        
        
        
        
        
        
        
        
        
        
        
        
        
      //  if let items = defaults.array(forKey: "TodoListArray") as? [String]{
        //     iteamArray = items
        //}
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iteamArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRowAtIndexPath called")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoIteamCell", for: indexPath)
        cell.textLabel?.text = iteamArray[indexPath.row].title
        
        if iteamArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(iteamArray[indexPath.row])
        
        if iteamArray[indexPath.row].done == false{
            iteamArray[indexPath.row].done = false
            
        }else {
            iteamArray [indexPath.row].done = false
        }
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
 //Mark - add new iteam
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
        //what will happen once the user clicks the add item button on our UIalert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.iteamArray.append(newItem)
            
            self.defaults.setValue(self.iteamArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        
     }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
    }
        alert.addAction(action)
        present(alert, animated: true, completion:  nil)
    }
    
}


