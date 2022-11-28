//
//  Dish.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 22.11.2022.
//

import Foundation

struct Dish: Decodable {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
    
}
