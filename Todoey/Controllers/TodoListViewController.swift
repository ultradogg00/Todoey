//
//  ViewController.swift
//  Todoey
//
//  Created by David Ashieze on 2018-12-14.
//  Copyright © 2018 David Ashieze. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Iteams.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print(dataFilePath)
        
        let newItem = Item()
        newItem.title = "kym"
        itemArray.append(newItem)
        
        
        let newItem2 = Item()
        newItem2.title = "punch Dave"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "dab"
        itemArray.append(newItem3)
        
        
        loadItems()
       
        
     //  if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
       //     iteamArray = items
     //   }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoIteamCell", for: indexPath)
        
         let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        // ternary operator ==>
        // value = condititon ? valueIfTrue : valueIfTrue
        
        cell.accessoryType = item.done ? .checkmark : .none
        
      
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(iteamArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
        self.saveItems()
        
       
        
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
            
            self.itemArray.append(newItem)
            
          self.saveItems()
        
     }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
    }
        alert.addAction(action)
        present(alert, animated: true, completion:  nil)
    }
  
    func saveItems(){
        
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        }catch{
            print("Error encoding item array, \(error)")
        }
        self.tableView.reloadData()
        
    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array, \(error)")
            }
            
        }
    }
        
        
 }
    
    



