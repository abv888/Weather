//
//  ChoiceViewController.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 12.01.2021.
//

import UIKit

class ChoiceViewController: UIViewController {

    
    
    
    @IBOutlet weak var choiceLabel: UILabel!
    
    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    
    
    
    
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        


        guard let content = sender.titleLabel?.text else {
            print("No text for touched button")
            return
        }
        
        
        let storyboardW = UIStoryboard(name: "Main", bundle: nil)

                guard let weatherViewController = storyboardW.instantiateViewController(identifier: "WeatheController") as? ViewController else { return }
        
        switch content {
        case "URLSession":
            weatherViewController.methodChoiceFlag = false
        case "Alamofire":
            weatherViewController.methodChoiceFlag = true
        default:
            print("unknown button")
        }
        
        show(weatherViewController, sender: nil)
        
    }
    
    
    
    
}
