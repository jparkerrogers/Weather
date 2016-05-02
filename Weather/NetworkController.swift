//
//  NetworkController.swift
//  Weather
//
//  Created by Jonathan Rogers on 4/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class NetworkController {
    
    static let baseURL = "http://api.openweathermap.org/data/2.5/weather"
    static let apiKey = "a185c092cde0e736c7006edc6f34b0db"
    
    
    
    static func searchURLByCity(city: String) -> NSURL {
        let escapedCityString = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())
        
        return NSURL(string: baseURL + "?q=\(escapedCityString!)" + "&appid=\(apiKey)")!
    }
    
    static func dataAtURL(url: NSURL, completion:(resultData: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            
            guard let data = data  else {
                print(error?.localizedDescription)
                completion(resultData: nil)
                return
            }
            
            completion(resultData: data)
        }
        
        dataTask.resume()
    }

}