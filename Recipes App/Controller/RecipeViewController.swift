//
//  RecipeViewController.swift
//  Recipes App
//
//  Created by Eliu Efraín Díaz Bravo on 01/08/20.
//  Copyright © 2020 Eliu Efraín Díaz Bravo. All rights reserved.
//

import UIKit
import CoreData

class RecipeViewController: UITableViewController {
    
    var recipes = [Recipe]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var selectedCategory : Category? {
        didSet { // Happens when selectedCategory is loaded with a value
            loadRecipes()
        }
    }
    var addRecipeVC : AddRecipeViewController = AddRecipeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: K.addRecipeSegue, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newRecipeVC = segue.destination as? AddRecipeViewController {
            newRecipeVC.context = context
            newRecipeVC.delegate = self
        }
        
        if let singleRecipeVC = segue.destination as? SingleRecipeViewController {
            
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.recipeCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = recipe.title
        
        return cell
    }
    
    //MARK: - Core Data Methods
    
    func loadRecipes(with request: NSFetchRequest<Recipe> = Recipe.fetchRequest()) {
        
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
        
        request.predicate = categoryPredicate
                
        do {
            recipes = try context.fetch(request)
        } catch {
            print("Error loading recipes, \(error)")
        }
        tableView.reloadData()
    }
}

extension RecipeViewController : RecipeSenderDelegate {
    
    func saveRecipe(with newRecipe: Recipe) {
        
        self.dismiss(animated: true) {
            newRecipe.parentCategory = self.selectedCategory
            
            self.recipes.append(newRecipe)

            do {
                try self.context.save()
                print("It was saved!!!")
            } catch {
                print("Error saving recipe, \(error)")
            }

            self.loadRecipes()
        }
    }
    
}


