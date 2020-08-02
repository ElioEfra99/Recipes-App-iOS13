//
//  CategoryViewController.swift
//  Recipes App
//
//  Created by Eliu Efraín Díaz Bravo on 01/08/20.
//  Copyright © 2020 Eliu Efraín Díaz Bravo. All rights reserved.
//

import UIKit

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Categories.plist")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        print(dataFilePath)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "New category", message: "", preferredStyle: .alert)
        
        alert.addTextField { (field) in
            textField = field
            field.placeholder = "New Category"
        }
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category(name: textField.text!)
            self.categories.append(newCategory)
            self.saveData()
            
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryItem = categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.categoryCellIdentifier, for: indexPath)
        cell.textLabel?.text = categoryItem.name
        return cell
    }
    
    //MARK: - Data Management Methods
    
    func saveData() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(categories)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error saving data to file, \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadData() {
        
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                categories = try decoder.decode([Category].self, from: data)
            } catch {
                print("Error trying to fetch data from file, \(error)")
            }
            
            
            self.tableView.reloadData()
        }
        
        
        
    }
}
