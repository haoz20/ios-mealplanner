//
//  MealTableViewCell.swift
//  Meal Planner
//
//  Created by Swan Htet Aung on 5/7/25.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        typeLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        noteLabel.font = UIFont.systemFont(ofSize: 16)
    }

    func setup(meal: Meal) {
        
        var vegEmoji = ""
        
        if meal.isVegetarian {
            vegEmoji = "🌱"
        }
        
        
        titleLabel.text = meal.title + vegEmoji
        noteLabel.text = meal.description
        switch meal.type {
        case .breakfast:
            typeLabel.text = "Breakfast"
            typeLabel.textColor = .systemOrange
        case .lunch:
            typeLabel.text = "Lunch"
            typeLabel.textColor = .systemGreen
        case .dinner:
            typeLabel.text = "Dinner"
            typeLabel.textColor = .systemBlue
        }
    }
    
}
