//
//  CardView.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 22.11.2022.



//
// Создаем кастомкласс для создания тени у ячеек в стаке.

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        layer.cornerRadius = 10
        cornerRadius = 10
    }
    
}
