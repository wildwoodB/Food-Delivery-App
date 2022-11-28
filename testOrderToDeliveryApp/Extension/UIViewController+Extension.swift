//
//  UIViewController+Extension.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 23.11.2022.
//

import UIKit

extension UIViewController {
    
    static var inditifire: String {
        return String(describing: self)
    }
    
    //функция которая конкретизирует нужный вьюкуонтроллер
    static func instantiate() -> Self {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: inditifire) as! Self
    }
    
}
