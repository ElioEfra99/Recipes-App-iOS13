//
//  CategoryViewController.swift
//  Recipes App
//
//  Created by Eliu Efraín Díaz Bravo on 01/08/20.
//  Copyright © 2020 Eliu Efraín Díaz Bravo. All rights reserved.
//

import UIKit

class CategoryViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: K.recipesSegue, sender: self)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
}
