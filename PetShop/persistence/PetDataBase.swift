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
    fileprivate let price = Expression<Int>("price")
    fileprivate let details = Expression<String>("details")
    fileprivate let imageUrl = Expression<String>("imageUrl")
    
    init() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("pets").appendingPathExtension("sqlite3")
            let db = try Connection(fileUrl.path)
            self.petDatabase = db
            print("Created dataBase")
        } catch {
            print(error)
        }
    }
    
    func createTabel() {
        let createTabel = self.petTabel.create { tabel in
            tabel.column(id, primaryKey: true)
            tabel.column(name)
            tabel.column(type)
            tabel.column(age)
            tabel.column(price)
            tabel.column(details)
            tabel.column(imageUrl)
        }

        do {
            try self.petDatabase.run(createTabel)
            print("Created Tabel")
        } catch {
            print(error)
        }
    }
    
    func insertPet(pet: Pet) {
        let insertPets = petTabel
                    .insert(name <- pet.name,
                            type <- pet.type,
                            age <- pet.age,
                            price <- Int(pet.price),
                            details <- pet.details,
                            imageUrl <- pet.imageUrl
                    )
        
        do {
            try self.petDatabase.run(insertPets)
            print("Inserted pet")
        } catch {
            print(error)
        }
    }
    
    func getPets() -> [Pet] {
        var pets: [Pet] = []
        
        do {
            let petsRaw = try self.petDatabase.prepare(self.petTabel)
            petsRaw.forEach { el in
                pets.append(
                    Pet(id: el[id],
                        name: el[name],
                        age: el[age],
                        type: el[type],
                        details: el[details],
                        price: Float(el[price]),
                        imageUrl: el[imageUrl]
                    )
                )
            }
            print("Get pets")
        } catch {
            print(error)
        }
        return pets
    }
}
