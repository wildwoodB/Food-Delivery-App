//
//  OnboardingCollectionViewCell.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 21.11.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let indetifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDiscriptionLbl: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDiscriptionLbl.text = slide.description
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
