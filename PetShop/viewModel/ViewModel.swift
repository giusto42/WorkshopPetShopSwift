//
//  ViewModel.swift
//  PetShop
//
//  Created by Sipos Eduard on 01/11/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import RxSwift

open class ViewModel {
    var dataChangeSubject = PublishSubject<Bool>()
    
    func notifyDataHasChanged() {
        dataChangeSubject.onNext(true)
    }
}
