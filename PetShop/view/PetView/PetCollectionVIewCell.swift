//
//  PetCollectionVIewCell.swift
//  PetShop
//
//  Created by Sipos Eduard on 28/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import UIKit

class PetCollectionVIewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func decorate(with pet: Pet) {
        titleLabel.text = pet.name
        ageLabel.text = "\(pet.age)"
        typeLabel.text = pet.type
        priceLabel.text = "\(pet.price) RON"
    }

}
