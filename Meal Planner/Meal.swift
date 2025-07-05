//
//  Meal.swift
//  Meal Planner
//
//  Created by Swan Htet Aung on 5/7/25.
//

import Foundation

enum MealType {
    case breakfast
    case lunch
    case dinner
}

class DayMeal {
    var date: Date
    var meals: [Meal]
    
    init(date: Date, meals: [Meal]) {
        self.date = date
        self.meals = meals
    }
    
}


class Meal {
    var title: String
    var type: MealType
    var isVegetarian: Bool
    var description: String
    
    init(title: String, type: MealType, isVegetarian: Bool, description: String) {
        self.title = title
        self.type = type
        self.isVegetarian = isVegetarian
        self.description = description
    }
    
}
