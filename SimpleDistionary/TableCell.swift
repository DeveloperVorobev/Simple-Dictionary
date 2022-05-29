//
//  TableCell.swift
//  SimpleDistionary
//
//  Created by Владислав Воробьев on 18.05.2022.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var translationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
