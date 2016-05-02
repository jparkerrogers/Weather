//
//  WeatherController.swift
//  Weather
//
//  Created by Jonathan Rogers on 5/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class WeatherController {
    
    
    static func weatherBySearchCity(city: String, completion:(result: Weather?) -> Void) {
        
        let url = NetworkController.searchURLByCity(city)
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            
            guard let resultData = resultData
                else {
                    print("NO DATA RETURNED")
                    completion(result: nil)
                    return
            }
            
            do {
                let weatherAnyObject = try NSJSONSerialization.JSONObjectWithData(resultData, options: NSJSONReadingOptions.AllowFragments)
                
                var weatherModelObject: Weather?
                
                if let weatherDictionary = weatherAnyObject as? [String : AnyObject] {
                    weatherModelObject = Weather(dictionary: weatherDictionary)
                }
                
                completion(result: weatherModelObject)
                
            } catch {
                completion(result: nil)
            }
            
        }
    }
}
