//
//  _uicollectionviewcontroller.swift
//  PetShop
//
//  Created by Sipos Eduard on 28/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

import UIKit

extension UICollectionView{
    
    func dequeueCell<T>(ofType type: T.Type, for indexPath: IndexPath) -> T{
        return dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as! T
    }
    
    func registerNib<T>(ofType type: T.Type, bundle: Bundle? = nil){
        let nib = UINib(nibName: String(describing: type), bundle: bundle)
        register(nib, forCellWithReuseIdentifier: String(describing: type))
    }
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
