//
//  InventoryCollectionCell.swift
//  IMH
//
//  Created by Simbesi on 30/10/20.
//  Copyright © 2020 Simbesi. All rights reserved.
//

import UIKit

class InventoryCollectionCell: UICollectionViewCell {

    @IBOutlet weak var itemsValue: UILabel!
    @IBOutlet weak var itemsCount: UILabel!
    @IBOutlet weak var inventoryName: UILabel!
    @IBOutlet weak var inventoryImage: UIImageView!
    @IBOutlet weak var menuBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 18
        // Initialization code
    }

    func setViewSelected(_ isSelected:Bool)  {
        self.layer.borderWidth = 1
        if isSelected{
            self.layer.borderColor = #colorLiteral(red: 0.168627451, green: 0.3803921569, blue: 0.8862745098, alpha: 1)
        }else{
            self.layer.borderColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        }
    }
}
