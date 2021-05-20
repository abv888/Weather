//
//  RequestModel.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 18.12.2020.
//

import Foundation

class RequestModel: Codable {
    
    var cod: String?
    var message: Float?
    var cnt: Float
    var list: [ListModel]?
    var city: CityModel?
}
