//
//  AddMealViewController.swift
//  Meal Planner
//
//  Created by Swan Htet Aung on 5/7/25.
//

import UIKit

class AddMealViewController: UIViewController {
    
    
    @IBOutlet weak var mealTextField: UITextField!
    @IBOutlet weak var typeSelection: UISegmentedControl!
    @IBOutlet weak var isVegetarian: UISwitch!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var noteTextView: UITextView!
    
    var onSave: ((Meal, Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Add Meal"
        navigationItem.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(saveMeal))
        
    }
    
    @objc func saveMeal() {
        let title = mealTextField.text ?? ""
        let isVeg = isVegetarian.isOn
        let note = noteTextView.text ?? ""
        let date = date.date
        var type = MealType.breakfast
        
        if typeSelection.selectedSegmentIndex == 0 {
            type = MealType.breakfast
        } else if typeSelection.selectedSegmentIndex == 1 {
            type = MealType.lunch
        } else if typeSelection.selectedSegmentIndex == 2 {
            type = MealType.dinner
        }
        
        let newMeal = Meal(title: title, type: type, isVegetarian: isVeg, description: note)
    
    }
    
        
}
