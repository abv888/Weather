//
//  DetailsViewController.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 18.12.2020.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var mainStackView: UIStackView!
    
    
    
    @IBOutlet weak var minMaxStackView: UIStackView!
    
    
    
    
    @IBOutlet weak var minStackView: UIStackView!
    
    @IBOutlet weak var minNameLabel: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    
    var mintemp = ""
    
    
    
    
    
    @IBOutlet weak var maxStackView: UIStackView!
    
    @IBOutlet weak var maxNameLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    var maxTemp = ""
    
    
    
    
    
    @IBOutlet weak var currTempStackView: UIStackView!
    
    @IBOutlet weak var currNameLabel: UILabel!
    
    @IBOutlet weak var currTempLabel: UILabel!
    
    var currTemp = ""
    
    
    
    
    
    
    @IBOutlet weak var feelsLikeStackView: UIStackView!
    
    @IBOutlet weak var feelsLikeNameLabel: UILabel!
    
    @IBOutlet weak var feelsLikeTempLabel: UILabel!
    
    var feelsLikeTemp = ""
    
    
    
    
    
    
    
    @IBOutlet weak var descriptionStackView: UIStackView!
    
    @IBOutlet weak var descriptionImageView: UIImageView!
    
    @IBOutlet weak var descriptionDetLabel: UILabel!
    
    var descrImage = UIImage()
    
    var descrText = ""
    
    
    
    
    
    
    @IBOutlet weak var humidityStackView: UIStackView!
    
    @IBOutlet weak var humidityNameLabel: UILabel!
    
    @IBOutlet weak var humidityValueLabel: UILabel!
    
    var humidyValue = ""
    
    
    
    
    
    
    @IBOutlet weak var windStackView: UIStackView!
    
    @IBOutlet weak var windNameLabel: UILabel!
    
    @IBOutlet weak var windValueLabel: UILabel!
    
    var windValue = ""
    
    
    
    
    
    @IBOutlet weak var pressureStackView: UIStackView!
    
    
    @IBOutlet weak var pressureNameLabel: UILabel!
    
    
    @IBOutlet weak var pressureValueLabel: UILabel!
    
    var pressureValue = ""
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currTempLabel.text = currTemp
        self.minTempLabel.text = mintemp
        self.maxTempLabel.text = maxTemp
        self.currTempLabel.text = currTemp
        self.feelsLikeTempLabel.text = feelsLikeTemp
        self.descriptionImageView.image = descrImage
        self.descriptionDetLabel.text = descrText
        self.humidityValueLabel.text = humidyValue
        self.windValueLabel.text = windValue
        self.pressureValueLabel.text = pressureValue
        

        
    }
    

    
    
    
    
    
    
}



