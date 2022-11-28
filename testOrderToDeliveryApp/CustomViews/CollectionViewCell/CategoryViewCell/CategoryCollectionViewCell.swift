//
//  CategoryCollectionViewCell.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 22.11.2022.
//

import UIKit
import Kingfisher


class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let inditifier = String(describing: CategoryCollectionViewCell.self)

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    func setup(category: DishCategory) {
        categoryTitleLbl.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
    
}
