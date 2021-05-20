//
//  AFWeatherLoader.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 04.01.2021.
//
//
import Foundation
import Alamofire


class AFWeatherLoader {



    private init() {}
    
    static let shared: AFWeatherLoader = AFWeatherLoader()


    func loadWeather2 (city: String, result: @escaping ((RequestModel?)->())){
        


        let API_KEY = "15bd268399be175bd78bbdb25030a9ce"
        
        AF.request("http://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&lang=ru&appid=\(API_KEY)").responseDecodable(of: RequestModel.self) { response in
//            debugPrint(response)
            result(response.value)
        }
        
       

        








    }


}
