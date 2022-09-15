//
//  InventoryTableCell.swift
//  IMH
//
//  Created by Simbesi on 10/12/20.
//  Copyright © 2020 Simbesi. All rights reserved.
//

import UIKit

class InventoryTableCell: UITableViewCell {

    @IBOutlet weak var itemsValue: UILabel!
    @IBOutlet weak var itemsCount: UILabel!
    @IBOutlet weak var inventoryName: UILabel!
    @IBOutlet weak var inventoryImage: UIImageView!
    @IBOutlet weak var menuBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
