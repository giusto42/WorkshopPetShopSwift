//
//  AppPrefs.swift
//  PetShop
//
//  Created by Sipos Eduard on 31/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import UIKit

protocol AppPrefs {
    func isFirstSession() -> Bool
    func incrementSessionCount() -> Void
    func currentSessionCount() -> Int
}

class AppPrefsImpl: AppPrefs{
    
    let defaults = UserDefaults.standard
    
    let keySessionCount = "revolver.session.count"
    
    
    func isFirstSession() -> Bool {
        return defaults.integer(forKey: keySessionCount) == 0
    }
    
    func incrementSessionCount() {
        defaults.set(currentSessionCount() + 1, forKey: keySessionCount)
    }
    
    func currentSessionCount() -> Int {
        return defaults.integer(forKey: keySessionCount)
    }
}

