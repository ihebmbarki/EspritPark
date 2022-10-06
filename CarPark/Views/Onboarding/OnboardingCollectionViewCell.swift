//
//  OnboardingCollectionViewCell.swift
//  CustomLogin
//
//  Created by iheb mbarki on 6/9/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
     
    
    func setUp(_ slide: OnboardingSlide) {
        
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
