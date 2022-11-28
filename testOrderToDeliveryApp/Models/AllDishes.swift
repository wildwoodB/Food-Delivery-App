//
//  AllDishes.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 27.11.2022.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?

}
