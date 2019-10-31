//
//  PetShopViewController.swift
//  PetShop
//
//  Created by Sipos Eduard on 28/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import UIKit
import RxSwift

class PetShopViewController: UIViewController {
    
    lazy var dataBase = PetDataBase()
    let dataChangeSubject = PublishSubject<Bool>()
    
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

        let barButton = UIBarButtonItem(customView: button)
        barButton.tintColor = getStatusBarTextColor()
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func addTitleToNavBar(title: String, color: UIColor) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 64, height: 21))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        titleLabel.textColor = color
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = false
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.text = title
        
        navigationItem.titleView = titleLabel
    }
    
    func showAlertPopup(title: String, message: String, actionTitle: String = "Dismiss") {
        let alertController = UIAlertController(title: title, message:message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func onBackPressed(){
           dismiss(animated: true, completion: nil)
       }
    
    func getStatusBarTextColor() -> UIColor{
           if preferredStatusBarStyle == .lightContent {
               return .white
           }else{
            return #colorLiteral(red: 0.5911557078, green: 0.7628985643, blue: 0.8081037402, alpha: 1)
           }
       }
}
