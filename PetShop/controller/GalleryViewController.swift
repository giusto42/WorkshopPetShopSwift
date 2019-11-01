//
//  GalleryViewController.swift
//  PetShop
//
//  Created by Sipos Eduard on 28/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import UIKit
import SDWebImage
import RxSwift

class GalleryViewController: PetShopViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var pets: [Pet] = []
    var nextIndex: Int = 1
    var prevIndex: Int = -1
    
    var viewModel: ViewModel?
    var dataBase: PetDataBase?
    
    fileprivate var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogoToNavBar()
        pets = dataBase!.getPets()
        
        imageView.sd_imageTransition = .fade
        imageView.sd_setImage(with: URL(string: pets[0].imageUrl))
        titleLabel.text = pets[0].name
        
        viewModel!.dataChangeSubject.subscribe(onNext: { didChanged in
            print("dataChangeSubject")
            print(didChanged)
            if didChanged {
                self.pets = self.dataBase!.getPets()
            }
        }).disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func backwardButtonPressed(_ sender: Any) {
        forwardButton.isHidden = false
        
        imageView.sd_setImage(with: URL(string: pets[prevIndex].imageUrl))
        titleLabel.text = pets[prevIndex].name
        
        nextIndex -= 1
        prevIndex -= 1
        if prevIndex == -1 {
            backwardButton.isHidden = true
        }
    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        backwardButton.isHidden = false
        
        imageView.sd_setImage(with: URL(string: pets[nextIndex].imageUrl))
        titleLabel.text = pets[nextIndex].name
        
        nextIndex += 1
        prevIndex += 1
        if nextIndex == pets.count {
            forwardButton.isHidden = true
        }
    }
}
