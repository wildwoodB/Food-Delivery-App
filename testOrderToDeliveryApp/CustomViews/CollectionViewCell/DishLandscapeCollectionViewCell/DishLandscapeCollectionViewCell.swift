//
//  DishLandscapeCollectionViewCell.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 23.11.2022.
//

import UIKit
import Kingfisher

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
    static let inditifire = String(describing: DishLandscapeCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
}
