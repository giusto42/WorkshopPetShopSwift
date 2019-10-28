//
//  GalleryViewController.swift
//  PetShop
//
//  Created by Sipos Eduard on 28/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import UIKit
import SDWebImage
class GalleryViewController: PetShopViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!
    
    let pets: [Pet] = Pet.dummyPets()
    var nextIndex: Int = 1
    var prevIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogoToNavBar()

        imageView.sd_imageTransition = .fade
        imageView.sd_setImage(with: URL(string: pets[0].imageUrl))
    }
    
    @IBAction func backwardButtonPressed(_ sender: Any) {
        forwardButton.isHidden = false
        
        imageView.sd_setImage(with: URL(string: pets[prevIndex].imageUrl))
        
        nextIndex -= 1
        prevIndex -= 1
        if prevIndex == -1 {
            backwardButton.isHidden = true
        }
    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        backwardButton.isHidden = false
        
        imageView.sd_setImage(with: URL(string: pets[nextIndex].imageUrl))
        
        nextIndex += 1
        prevIndex += 1
        if nextIndex == pets.count {
            forwardButton.isHidden = true
        }
    }
}
