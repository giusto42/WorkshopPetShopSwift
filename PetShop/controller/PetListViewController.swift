//
//  PetsViewController.swift
//  PetShop
//
//  Created by Sipos Eduard on 28/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import UIKit
import RxSwift

class PetListViewController: PetShopViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var pets: [Pet] = []
    var selectedPet: Pet?
    var viewModel: ViewModel?
    var dataBase: PetDataBase?
    
    fileprivate var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addLogoToNavBar()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.pets = self.dataBase!.getPets()
        
        collectionView.registerNib(ofType: PetCollectionVIewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
        collectionView.collectionViewLayout = layout
        
        viewModel!.dataChangeSubject.subscribe(onNext: { didChanged in
            print("dataChangeSubject")
            print(didChanged)
            if didChanged {
                self.pets = self.dataBase!.getPets()
                self.collectionView.reloadData()
            }
        }).disposed(by: disposeBag)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueCell(ofType: PetCollectionVIewCell.self, for: indexPath)
            cell.decorate(with: pets[indexPath.row])
            return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openPetDetails(pet: pets[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 103)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationNavigationController = segue.destination as! UINavigationController
        let detailsViewController = destinationNavigationController.topViewController as! DetailsViewController
        detailsViewController.pet = selectedPet
    }
    
    func openPetDetails(pet: Pet) {
        self.selectedPet = pet
        self.performSegue(withIdentifier: "goToDetails", sender: nil)
    }
}
