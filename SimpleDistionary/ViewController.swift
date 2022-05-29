//
//  ViewController.swift
//  SimpleDistionary
//
//  Created by Владислав Воробьев on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let dectionationVC = segue.destination as? TabelViewTableVC else {return}
        
        if segue.identifier == "showDictionary" {
            dectionationVC.isDictionaryTablel = true
        } else {
            dectionationVC.isDictionaryTablel = false
        }
    }
    
    @IBAction func dictonaryButtonPressed(_ sender: Any) {
     choseButton(isDictionaryTablel: true)
    }
    
    @IBAction func swiftButtonPressed(_ sender: Any) {
        choseButton(isDictionaryTablel: false)
    }
    
    private func choseButton(isDictionaryTablel: Bool){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "TabelViewTableVC") as! TabelViewTableVC
        editScreen.isDictionaryTablel = isDictionaryTablel
    }
}

