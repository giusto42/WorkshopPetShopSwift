//
//  PetDataBase.swift
//  PetShop
//
//  Created by Sipos Eduard on 28/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import SQLite

class PetDataBase {
    
    fileprivate var petDatabase: Connection!
    
    fileprivate let petTabel = Table("pets")
    
    fileprivate let id = Expression<Int>("id")
    fileprivate let name = Expression<String>("name")
    fileprivate let type = Expression<String>("type")
    fileprivate let age = Expression<Int>("age")
    fileprivate let price = Expression<Float>("age")
    fileprivate let details = Expression<Float>("details")
    fileprivate let imageUrl = Expression<String>("imageUrl")
    
    init() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("pets").appendingPathExtension("sqlite3")
            let db = try Connection(fileUrl.path)
            self.petDatabase = db
        } catch {
            print(error)
        }
    }
    
    func createTabel() {
        
    }
    
    func insertPet(pet: Pet) {
        
    }
    
    func getPets() -> [Pet] {
        return []
    }
}
