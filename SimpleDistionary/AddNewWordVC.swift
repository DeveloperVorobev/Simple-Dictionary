//
//  AddNewWordVC.swift
//  SimpleDistionary
//
//  Created by Владислав Воробьев on 18.05.2022.
//

import UIKit

class AddNewWordVC: UITableViewController {
    var word: DictionaryCell?
    var isDictonary: Bool?
    var isEditingScreen: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
 
    @IBOutlet var wordTF: UITextField!
    @IBOutlet var translationTF: UITextField!
    @IBOutlet var additinallyTF: UITextField!
    
    private func setupScreen(){
        guard let cell = word else {return}
        wordTF.text = cell.word
        translationTF.text = cell.translation
        additinallyTF.text = cell.additinally
        
    }
    @IBAction func saveItem(_ sender: UIBarButtonItem) {
        let newWord = DictionaryCell(word: wordTF.text ?? "", translation: translationTF.text, isDictonary: isDictonary ?? true, additinally: additinallyTF.text)
        if isEditingScreen{
            try! realm.write{
                word?.word = wordTF.text ?? ""
                word?.translation = translationTF.text
                word?.additinally = additinallyTF.text
            }
            
        } else {
            StorageManager.saveObject(newWord)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
