//
//  TabelViewTableVC.swift
//  SimpleDistionary
//
//  Created by Владислав Воробьев on 18.05.2022.
//

import UIKit
import RealmSwift

class TabelViewTableVC: ViewController {
    var isDictionaryTablel: Bool = true
    private var storage: Results<DictionaryCell>!
    private var readyStorege: [DictionaryCell?] = []

    @IBOutlet var tabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        storage = realm.objects(DictionaryCell.self)
        setupStorage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabelView.reloadData()
    }

    // MARK: - Table view data source

    @IBAction func canselAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            guard let indexPath = tabelView.indexPathForSelectedRow else {return}
            let storyboard = segue.destination as? AddNewWordVC
            storyboard?.word = storage[indexPath.row]
            storyboard?.isEditingScreen = true
        }
        let dectination = segue.destination as? AddNewWordVC
        dectination?.isDictonary = isDictionaryTablel
    }
    
    private func setupStorage(){

            for item in storage {
                
                if item.isDictonary == self.isDictionaryTablel{
                    readyStorege.append(item)
                }
            }
        }

}
extension TabelViewTableVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableCell
        cell.wordLabel.text = storage[indexPath.row].word
        cell.translationLabel.text = storage[indexPath.row].translation
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return storage.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let word = storage[indexPath.row]
            StorageManager.deliteObject(word)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}










