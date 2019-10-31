//
//  _uiview.swift
//  PetShop
//
//  Created by Sipos Eduard on 31/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat = 1000) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func fullRoundCorners(){
        let maxSide = max(frame.width, frame.height)
        self.roundCorners(corners: .allCorners, radius: maxSide / 2)
    }
}
