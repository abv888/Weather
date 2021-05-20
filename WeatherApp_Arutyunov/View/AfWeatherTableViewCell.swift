//
//  AfWeatherTableViewCell.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 04.01.2021.
//

import UIKit

class AfWeatherTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var afMainStack: UIStackView!
    
    
    
    @IBOutlet weak var afVertStack: UIStackView!
    
    
    @IBOutlet weak var afDateLabel: UILabel!
    
    
    @IBOutlet weak var afTimeLabel: UILabel!
    
    @IBOutlet weak var afTempLabel: UILabel!
    
    
    @IBOutlet weak var afImageView: UIImageView!
    
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
