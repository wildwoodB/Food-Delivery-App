//
//  Order.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 24.11.2022.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
