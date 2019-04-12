//
//  ItemCell.swift
//  GridViewExampleApp
//
//  Created by Chandimal, Sameera on 12/22/17.
//  Copyright © 2017 Pearson. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setItemName(text: String) {
        self.textLabel.text = text
    }
}
