//
//  Weather.swift
//  Weather
//
//  Created by Jonathan Rogers on 4/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Weather {
    
    static let kWeather = "weather"
    static let kMain = "main"
    static let kDescription = "description"
    static let kIcon = "icon"
    static let kTemperature = "temp"
    static let kWind = "wind"
    static let kWindSpeed = "speed"
    static let kName = "name"
    
    var weather: String = ""
    var main: String = ""
    var description: String = ""
    var icon: String = ""
    var temperature: String = ""
    var windSpeed: String = ""
    var name: String = ""
    var temperatureK: Float?
    var temperatureC: Float? {
        get {
            if let temperatureK = temperatureK {
                return temperatureK - 273.15
            } else {
                return nil
            }
        }
    }
    
    init?(dictionary: [String: AnyObject]) {
        
        if let arrayUsingWeatherKey = dictionary[Weather.kWeather] as? [[String: AnyObject]] {
            
            if let main = arrayUsingWeatherKey[0][Weather.kMain] as? String {
                self.main = main
            }
            if let description = arrayUsingWeatherKey[0][Weather.kDescription] as? String {
                self.description = description
            }
            if let icon = arrayUsingWeatherKey[0][Weather.kIcon] as? String {
                self.icon = icon
            }
        }
        if let main = dictionary[Weather.kMain] as? [String: AnyObject] {
            
            if let temperature =  main[Weather.kTemperature] as? String{
                self.temperatureK = Float(temperature)
            }
        }
        if let wind = dictionary[Weather.kWind] as? [String: AnyObject] {
            
            if let windSpeed = wind[Weather.kWindSpeed] as? String {
                self.windSpeed = windSpeed
            }
        }
        
        if let name = dictionary[Weather.kName] as? String {
            self.name = name
        }
    }
    
}















