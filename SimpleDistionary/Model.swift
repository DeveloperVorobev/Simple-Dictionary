//
//  Model.swift
//  SimpleDistionary
//
//  Created by Владислав Воробьев on 18.05.2022.
//

import Foundation
import UIKit
import RealmSwift
class DictionaryCell: Object {
    @Persisted var word = ""
    @Persisted var translation: String?
    @Persisted var additinally: String?
    @Persisted var isDictonary: Bool
    @Persisted var date = Date()
    convenience init(word: String, translation: String?,  isDictonary: Bool, additinally: String?){
        self.init()
        self.word = word
        self.translation = translation
        self.additinally = additinally
        self.isDictonary = isDictonary
    }
}
