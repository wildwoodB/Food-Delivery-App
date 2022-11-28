//
//  DishCategory.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 22.11.2022.
//

import Foundation


struct DishCategory: Decodable {
    let id, name, image: String?
    
    
    /// кодированные ключи, приравнивают значения в коде к значениям в бэке. на примере name = "title" - нэйм наша переменна, тайтл та же переменная но в бэке.
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
