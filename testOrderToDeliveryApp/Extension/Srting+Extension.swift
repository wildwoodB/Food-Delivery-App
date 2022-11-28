//
//  Srting+Extension.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 22.11.2022.
//

import Foundation
// простое расширение возрощающее юрл в виде строки
extension String {
    
    var asUrl:URL? {
        return URL(string: self)
    }
}
