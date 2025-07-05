//
//  ViewController.swift
//  Meal Planner
//
//  Created by Swan Htet Aung on 5/7/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var dayMeals: [DayMeal] = [
        DayMeal(date: Date(), meals:[
            Meal(title: "Beef Steak", type: .breakfast, isVegetarian: false, description: "Beef steak at countryside steakhouse"),
            Meal(title: "Tomyum Noodle", type: .lunch, isVegetarian: true, description: "Vegetarian tomyum noodle with bean sprouts")
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dayMeals.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayMeals[section].meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "mealcell") as? MealTableViewCell{
            let meal = dayMeals[indexPath.section].meals[indexPath.row]
            cell.setup(meal: meal)
            return cell
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dayMeals[section].date.formatted(date: .long, time: .omitted)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {_, _, completion in
            self.dayMeals[indexPath.section].meals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}

