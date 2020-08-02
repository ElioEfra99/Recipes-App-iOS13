//
//  RecipeViewController.swift
//  Recipes App
//
//  Created by Eliu Efraín Díaz Bravo on 01/08/20.
//  Copyright © 2020 Eliu Efraín Díaz Bravo. All rights reserved.
//

import UIKit

class RecipeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
