//
//  WrongColorCollectionViewCell.swift
//  chooseWrongColorGame
//
//  Created by Abhi Thummar on 11/03/22.
//

import UIKit

class WrongColorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var colorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
        
    }

    private func setUpCell(){
        colorNameLabel.layer.cornerRadius = 15
        colorNameLabel.layer.masksToBounds = true
    }
}
