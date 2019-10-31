//
//  DetailsViewController.swift
//  PetShop
//
//  Created by Sipos Eduard on 28/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: PetShopViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailTextView: UITextView!
    
    var pet: Pet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackButton()
        detailTextView.text = pet!.details
        
        addTitleToNavBar(title: pet!.name, color: #colorLiteral(red: 0.5254901961, green: 0.7137254902, blue: 0.7647058824, alpha: 1))
        imageView.sd_imageTransition = .fade
        imageView.sd_setImage(with: URL(string: pet!.imageUrl))
        
        detailTextView.isEditable = false
        detailTextView.sizeToFit()
        detailTextView.layer.cornerRadius = 20
        detailTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
