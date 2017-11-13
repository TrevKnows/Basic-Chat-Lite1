//
//  PeripheralTableViewCell.swift
//  Basic Chat Lite
//
//  Created by Trevor Beaton on 7/11/17.
//  Copyright © 2017 Vanguard Logic LLC. All rights reserved.
//

import UIKit

class PeripheralTableViewCell: UITableViewCell {

    @IBOutlet weak var rssiLabel: UILabel!
    @IBOutlet weak var peripheralLabel: UILabel!
 
    
    
    
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
