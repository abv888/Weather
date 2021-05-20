//
//  WeatherLoader.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 14.12.2020.
//

import Foundation

//protocol WeatherLoaderDelegate {
 //   func loaded()
//}


class WeatherLoader {
    
    private init() {}
    
    //var delegate: WeatherLoaderDelegate?
    
    static let shared: WeatherLoader = WeatherLoader()
    
    
    
    func loadWeather(city: String, result: @escaping ((RequestModel?)->())) {
        
        let API_KEY = "15bd268399be175bd78bbdb25030a9ce"
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&lang=ru&appid=\(API_KEY)") else {
            return
        }
        
        //        print(url as Any)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        
        
        let task = URLSession(configuration: .default)
        task.dataTask(with: request) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                var decoderRequestModel: RequestModel?
                
                if data != nil {
                    decoderRequestModel = try? decoder.decode(RequestModel.self, from: data!)
                }
                
                result(decoderRequestModel)
            } else {
                print(error as Any)
            }

        }.resume()

        
    }
    
    
    
    
}
    
