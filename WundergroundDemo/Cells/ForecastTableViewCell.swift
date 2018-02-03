//
//  ForecastTableViewCell.swift
//  WundergroundDemo
//
//  Created by Casey Tritt on 2/3/18.
//  Copyright © 2018 University of Cincinnati. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var forecastDayOfWeekLabel: UILabel!
    @IBOutlet weak var forecastConditionImage: UIImageView!
    @IBOutlet weak var forecastHighTempLabel: UILabel!
    @IBOutlet weak var forecastLowTempLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
