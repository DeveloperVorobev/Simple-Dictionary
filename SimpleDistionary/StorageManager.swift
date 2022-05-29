//
//  StorageManager.swift
//  SimpleDistionary
//
//  Created by Владислав Воробьев on 18.05.2022.
//

import Foundation
import RealmSwift
let realm = try! Realm()
class StorageManager {
    static func saveObject(_ word: DictionaryCell){
        try! realm.write{
            realm.add(word)
        }
    }
    static func deliteObject (_ word: DictionaryCell){
        try! realm.write{
            realm.delete(word)
        }
    }
}
