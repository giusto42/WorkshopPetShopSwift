//
//  PetShopViewController.swift
//  PetShop
//
//  Created by Sipos Eduard on 28/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import UIKit

class PetShopViewController: UIViewController {
    
    lazy var logoView: UIView = {
       let wrapper = UIView(frame: CGRect(x: 0, y: 0, width: 57, height: 28))
       let imageView = UIImageView(image: UIImage(named: "logo")!)
       imageView.frame = CGRect(x: 0, y: 0, width: 57, height: 28)
       imageView.contentMode = .scaleAspectFit
       imageView.tintColor = getStatusBarTextColor()
       wrapper.addSubview(imageView)
       return wrapper
   }()
    
    func addLogoToNavBar() {
        self.navigationItem.titleView = logoView
    }
    
    func addBackButton(){
        let button =  UIButton(type: .system)
        button.setImage(UIImage(named: "back_button"), for: .normal)
        button.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 30)
        button.imageEdgeInsets = UIEdgeInsets(top: 1, left: -24, bottom: -1, right: 24)
        button.tintColor = getStatusBarTextColor()
        
        let label = UILabel(frame: CGRect(x: 10, y: 5, width: 50, height: 20))
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Back"
        label.textAlignment = .center
        label.textColor = getStatusBarTextColor()
        label.backgroundColor = .clear
        button.addSubview(label)
        
        let barButton = UIBarButtonItem(customView: button)
        barButton.tintColor = getStatusBarTextColor()
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func addTitleToNavBar(title: String, color: UIColor) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 64, height: 21))
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        titleLabel.textColor = color
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = false
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.text = title
        
        navigationItem.titleView = titleLabel
    }
    
    @objc func onBackPressed(){
           dismiss(animated: true, completion: nil)
       }
    
    func getStatusBarTextColor() -> UIColor{
           if preferredStatusBarStyle == .lightContent {
               return .white
           }else{
            return .black
           }
       }
}
