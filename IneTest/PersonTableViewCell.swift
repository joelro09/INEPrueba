//
//  PersonTableViewCell.swift
//  IneTest
//
//  Created by Jimena Reyes Reyes on 20/02/23.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var namePerson: UILabel!
    @IBOutlet weak var lastNamePerson: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
