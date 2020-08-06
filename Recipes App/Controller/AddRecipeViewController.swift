import UIKit
import CoreData

protocol RecipeSenderDelegate {
    
    func saveRecipe(with newRecipe: Recipe)

}

class AddRecipeViewController: UIViewController {
    
    var delegate: RecipeSenderDelegate?
    
    var context: NSManagedObjectContext?
    
    @IBOutlet weak var recipeName: UITextField!
    @IBOutlet weak var ingredients: UITextView!
    @IBOutlet weak var steps: UITextView!
    @IBOutlet weak var equipment: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStepsPlaceholder()
        setIngredientsPlaceholder()
        setEquipmentPlaceholder()
    }
    
    @IBAction func createRecipePressed(_ sender: UIButton) {
        let newRecipe = Recipe(context: context!)
        newRecipe.title = recipeName.text!
        newRecipe.ingredients = ingredients.text!
        newRecipe.steps = steps.text!
        newRecipe.equipment = equipment.text!
        
        delegate?.saveRecipe(with: newRecipe)
    }
    
    //MARK: - Placeholder functions
    
    func setIngredientsPlaceholder() {
        ingredients.text = "Ingredients"
        ingredients.textColor = UIColor.lightGray
    }
    
    func setStepsPlaceholder() {
        steps.text = "Steps"
        steps.textColor = UIColor.lightGray

    }
    
    func setEquipmentPlaceholder() {
        equipment.text = "Cooking Equipment"
        equipment.textColor = UIColor.lightGray

    }
    
    //MARK: - UI TextView Delegate Methods

//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//
//        // Combine the textView text and the replacement text to
//        // create the updated text string
//        let currentText:String = textView.text
//        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
//
//        // If updated text view will be empty, add the placeholder
//        // and set the cursor to the beginning of the text view
//        if updatedText.isEmpty {
//
//            textView.text = "Placeholder"
//            textView.textColor = UIColor.lightGray
//
//            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
//        }
//
//        // Else if the text view's placeholder is showing and the
//        // length of the replacement string is greater than 0, set
//        // the text color to black then set its text to the
//        // replacement string
//         else if textView.textColor == UIColor.lightGray && !text.isEmpty {
//            textView.textColor = UIColor.black
//            textView.text = text
//        }
//
//        // For every other case, the text should change with the usual
//        // behavior...
//        else {
//            return true
//        }
//
//        // ...otherwise return false since the updates have already
//        // been made
//        return false
//    }
//
//    func textViewDidChangeSelection(_ textView: UITextView) {
//        if self.view.window != nil {
//            if textView.textColor == UIColor.lightGray {
//                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
//            }
//        }
//    }

}
