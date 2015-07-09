//
//  PlanTableViewCell.swift
//  MyMedsPlanForiPhone
//
//  Created by Felix Olivares on 7/2/15.
//  Copyright © 2015 Felix Olivares. All rights reserved.
//

import UIKit


class PlanTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timerLabel: MZTimerLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let textColor : UIColor = UIColor(rgb: 0x2a4d69)
        let color : UIColor = UIColor(colorwithRGB: 0x2a4d69)
        
        
        nameLabel.center = CGPointMake(10, 10)
        nameLabel.textColor = textColor
        self.contentView.addSubview(nameLabel)
        
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
