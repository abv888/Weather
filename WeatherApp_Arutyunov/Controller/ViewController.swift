//
//  ViewController.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 14.12.2020.
//

import UIKit




class ViewController: UIViewController, UISearchResultsUpdating {
    
    
    
    
    @IBOutlet weak var weatherMainTableView: UITableView!
    
    
    var requestModel: RequestModel! {
        didSet {
            DispatchQueue.main.async {
                self.weatherMainTableView.reloadData()
                self.navigationItem.title = self.requestModel.city?.name
            }
            
        }
    }
    
    
    var loadedFlag = false
    
    var timer = Timer()
    
    var methodChoiceFlag = false
    
    
    
//    let alert = UIAlertController(title: "Error", message: "Неверно введен город!", preferredStyle: .alert)
//    let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavBar()
        self.weatherMainTableView.dataSource = self
        self.weatherMainTableView.delegate = self
//        alert.addAction(okButton)
        
        

    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        

    }
    
    
    fileprivate func setupNavBar() {
        
        if methodChoiceFlag {
            self.navigationItem.title = "AlamoFire"
        }else {
            self.navigationItem.title = "Погода"
        }
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let city = searchController.searchBar.text!
        timer.invalidate()
        
        
        if methodChoiceFlag {
            if city.count > 1 {
                timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
                    AFWeatherLoader.shared.loadWeather2(city: city, result: { (model) in
                        if model != nil{
                            self.requestModel = model
                            self.loadedFlag = true
                        }
                    
                        
                
                    })
                
                })
                
            }
        }else {
            if city.count > 1 {
                timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
                    WeatherLoader.shared.loadWeather(city: city, result:  { (model) in
                        if model != nil{
                            self.requestModel = model
                            self.loadedFlag = true
                        }
                        
                
                    })
                
                })
                
            }
            
        }
        
        
        
    }

}




 //MARK: - UITableViewDatasource methods

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if loadedFlag {
            return self.requestModel.list!.count
        } else {
            return 0
        }
        
       
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            
        
        
        let cell = weatherMainTableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherTableViewCell
        
        let datetext = self.requestModel.list![indexPath.row].dt_txt!
        let datetime = datetext.components(separatedBy: " ")
        
        cell.dateLabel.text = datetime[0]
        cell.timeLabel.text = datetime[1]
        cell.temperatureLabel.text = String(Int(self.requestModel.list![indexPath.row].main!.temp!)) + "°С"
        cell.descriptionLabel.text = self.requestModel.list![indexPath.row].weather![0].description
        
        
        if let iconDataMain = try? Data(contentsOf: URL(string: "http://openweathermap.org/img/wn/\(self.requestModel.list![indexPath.row].weather![0].icon!)@2x.png")!){
            cell.descriptionImageViewMain.image = UIImage(data: iconDataMain)!
        }

        return cell
    }
    
    
    
    
    

    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
                guard let detailsViewController = storyboard.instantiateViewController(identifier: "detailsCntrllr") as? DetailsViewController else { return }
        
        
        
        
        
        detailsViewController.mintemp = String(Int(self.requestModel.list![indexPath.row].main!.temp_min ?? 0.0)) + "°С"
        detailsViewController.maxTemp = String(Int((self.requestModel.list![indexPath.row].main?.temp_max ?? 0.0))) + "°С"
        detailsViewController.currTemp = String(Int((self.requestModel.list![indexPath.row].main?.temp ?? 0.0))) + "°С"
        detailsViewController.feelsLikeTemp = String(Int((self.requestModel.list![indexPath.row].main?.feels_like ?? 0.0))) + "°С"
        detailsViewController.descrText = String((self.requestModel.list![indexPath.row].weather![0].description ?? ""))
        if let iconData = try? Data(contentsOf: URL(string: "http://openweathermap.org/img/wn/\(self.requestModel.list![indexPath.row].weather![0].icon!)@2x.png")!){
            detailsViewController.descrImage = UIImage(data: iconData)!
        }
        detailsViewController.humidyValue = String((self.requestModel.list![indexPath.row].main?.humidity ?? 0)) + "%"
        detailsViewController.windValue = String(Int(self.requestModel.list![indexPath.row].wind?.speed ?? 0.0)) + " м/с"
        detailsViewController.pressureValue = String(Int(Double((self.requestModel.list![indexPath.row].main?.pressure ?? 0))/1.33)) + " мм.рт.ст"

        
        
        weatherMainTableView.deselectRow(at: indexPath, animated: true)
        
        show(detailsViewController, sender: nil)
        
        
                
                

    }
    
    
    
   
    
    

}

