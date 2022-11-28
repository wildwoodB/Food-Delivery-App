//
//  AppError.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 25.11.2022.
//

import Foundation

/// перечисление разных ошибок
enum AppError: LocalizedError {
    
    case errorDecoding
    case unknownError
    case invalidURL
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Запрос не может быть декодирован"
        case .unknownError:
            return "Понятия не имею что произошло"
        case .invalidURL:
            return "Чувак, мне нужен правильный URL"
        case .serverError(let error):
            return error
        }
        
    }
    
}
