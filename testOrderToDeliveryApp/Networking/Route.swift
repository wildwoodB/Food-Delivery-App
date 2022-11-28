//
//  Route.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 25.11.2022.
//

import Foundation

/// перечисление сценариев использование юрл ссылки преобразованной из текста для запроса (путь).
enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case fetchAllCategories
    
    var description: String {
        switch self {
        case .fetchAllCategories: return "/dish-categories"
        }
    }
}
