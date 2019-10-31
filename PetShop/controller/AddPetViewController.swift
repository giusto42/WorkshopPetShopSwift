//
//  AddPetViewController.swift
//  PetShop
//
//  Created by Sipos Eduard on 28/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class AddPetViewController: PetShopViewController {
    
    @IBOutlet weak var nameTxt: SkyFloatingLabelTextField!
    @IBOutlet weak var ageTxt: SkyFloatingLabelTextField!
    @IBOutlet weak var typeTxt: SkyFloatingLabelTextField!
    @IBOutlet weak var detailsTxt: SkyFloatingLabelTextField!
    @IBOutlet weak var priceTxt: SkyFloatingLabelTextField!
    @IBOutlet weak var imageUrlTxt: SkyFloatingLabelTextField!
    @IBOutlet weak var addPetButton: UIButton!

    var pet: Pet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPetButton.roundCorners(corners: .allCorners, radius: 10)
        addLogoToNavBar()
    }
    
    private func areFiledCompleted() -> Bool {
        guard  let nameText = nameTxt.text, !nameText.isEmpty,
            let ageText = ageTxt.text, !ageText.isEmpty,
            let typeText = typeTxt.text, !typeText.isEmpty,
            let detailsText = detailsTxt.text, !detailsText.isEmpty,
            let priceText = priceTxt.text, !priceText.isEmpty,
            let imageUrlText = imageUrlTxt.text, !imageUrlText.isEmpty else {
            return false
        }
        pet = Pet(id: 1,
                  name: nameText,
                  age: Int(ageText)!,
                  type: typeText,
                  details: detailsText,
                  price: Float(priceText)!,
                  imageUrl: imageUrlText)
        return true
    }
    
    private func clearFileds() {
        nameTxt.text = nil
        ageTxt.text = nil
        typeTxt.text = nil
        detailsTxt.text = nil
        priceTxt.text = nil
        imageUrlTxt.text = nil
    }
    
    private func showSuccessfulPopup() {
        self.showAlertPopup(title: "Congratulations!", message: "Just added a pet!", actionTitle: "Done")
    }
    
    private func showErrorPopup() {
        self.showAlertPopup(title: "Ups", message: "You may forgot to complete a field!")
    }
    
    @IBAction func addPetButtonPressed(_ sender: Any) {
        if areFiledCompleted() {
            dataBase.insertPet(pet: pet!)
            clearFileds()
            showSuccessfulPopup()
        } else {
            showErrorPopup()
        }
        dataChangeSubject.onNext(true)
    }
}
