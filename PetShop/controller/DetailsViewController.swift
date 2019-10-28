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
    @IBOutlet weak var detailLabel: UILabel!
    
    var pet: Pet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackButton()
        detailLabel.text = pet!.details
        
        addTitleToNavBar(title: pet!.name, color: .black)
        imageView.sd_imageTransition = .fade
        imageView.sd_setImage(with: URL(string: pet!.imageUrl))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let path = UIBezierPath(roundedRect:detailLabel.bounds,
                                byRoundingCorners:[.bottomRight, .bottomLeft],
                                cornerRadii: CGSize(width: 20, height:  20))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        detailLabel.layer.mask = maskLayer
    }
    
}
