//
//  UIView+Extension.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 20.11.2022.
//

import UIKit
// добавляем расширние в ЮайВью для корнеррадиуса
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
