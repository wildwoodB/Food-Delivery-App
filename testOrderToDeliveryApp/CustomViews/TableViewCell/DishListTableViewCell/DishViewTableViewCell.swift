//
//  DishViewTableViewCell.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 24.11.2022.
//

import UIKit

class DishViewTableViewCell: UITableViewCell {
    
    
    static let inditifire = String(describing: DishViewTableViewCell.self)

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitleLbl: UILabel!
    @IBOutlet weak var dishDescriptionLbl: UILabel!
    
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishTitleLbl.text = dish.name
        dishDescriptionLbl.text = dish.description
    }
    
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl )
        dishTitleLbl.text = order.name
        dishDescriptionLbl.text = order.dish?.name
        
        
    }
    
}
