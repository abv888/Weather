//
//  ListModel.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 18.12.2020.
//

import Foundation

class ListModel: Codable {
    
    var dt: Float?
    var main: MainModel?
    var weather: [WeatherModel]?
//    var clouds: CloudsModel?
    var wind: WindModel?
//    var visibility: Int?
//    var pop: Float?
//    var sys:SysModel?
//    var snow: SnowModel?
    var dt_txt: String?
    
}
