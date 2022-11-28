//
//  ApiResponse.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 26.11.2022.
//

import Foundation

struct ApiRespons<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
