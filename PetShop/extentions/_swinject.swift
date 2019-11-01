//
//  _swinject.swift
//  PetShop
//
//  Created by Sipos Eduard on 31/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        
        Container.loggingFunction = nil
        
        defaultContainer.register(AppPrefs.self) {resolver in
            AppPrefsImpl()
        }.inObjectScope(.container)
        
        defaultContainer.register(ViewModel.self) { resolver in
            ViewModel()
        }.inObjectScope(.container)
        
        defaultContainer.register(PetDataBase.self) { resolver in
            PetDataBase()
        }.inObjectScope(.container)
        
        defaultContainer.storyboardInitCompleted(UINavigationController.self){ resolver, controller in
            // ignore
        }
        
        defaultContainer.storyboardInitCompleted(AddPetViewController.self) {  resolver, controller in
            controller.viewModel = resolver.resolve(ViewModel.self)
            controller.dataBase = resolver.resolve(PetDataBase.self)
        }
        
        defaultContainer.storyboardInitCompleted(PetListViewController.self) {  resolver, controller in
            controller.viewModel = resolver.resolve(ViewModel.self)
            controller.dataBase = resolver.resolve(PetDataBase.self)
        }

        defaultContainer.storyboardInitCompleted(GalleryViewController.self) {  resolver, controller in
            controller.viewModel = resolver.resolve(ViewModel.self)
            controller.dataBase = resolver.resolve(PetDataBase.self)
        }
    }
}
