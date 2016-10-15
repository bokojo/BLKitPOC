//
//  WeatherTableViewCell.swift
//  BLKitPOC
//
//  Created by Burton Lee on 10/14/16.
//  Copyright © 2016 Buffalo Ladybug LLC. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell
{
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    override func prepareForReuse()
    {
        self.conditionsLabel.text = nil
        self.urlLabel.text = nil
        
        super.prepareForReuse()
    }
    
}
