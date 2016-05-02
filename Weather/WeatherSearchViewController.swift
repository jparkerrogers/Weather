//
//  WeatherSearchViewController.swift
//  Weather
//
//  Created by Jonathan Rogers on 4/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class WeatherSearchViewController: UIViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var citySearchBar: UISearchBar!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var IconImageView: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    
        if let cityToSearch = citySearchBar.text {
            
            if cityToSearch == "" {
                self.alertController()
            } else {
            
            WeatherController.weatherBySearchCity(cityToSearch) { (result) in
                guard let weatherResult = result else { return }
                
                dispatch_async(dispatch_get_main_queue()) { () in
                    
                    self.cityNameLabel.text = weatherResult.name
                    self.mainLabel.text = weatherResult.main
                    self.descriptionLabel.text = weatherResult.description
                    if let windSpeed = weatherResult.windSpeed {
                        self.windSpeedLabel.text = String(windSpeed) + " KMS"
                    }
                    if let temperatureC = weatherResult.temperatureC {
                        self.temperatureLabel.text = String(temperatureC) + "°C"
                    } else {
                        self.temperatureLabel.text = "NO TEMPERATURE AVAILABLE"
                    }
                }
            }
        }
        citySearchBar.resignFirstResponder()
        }
    }
    
    func alertController() {
        let alert = UIAlertController()
        alert.message = "Unable to search if textField is empty"
        let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(alertAction)
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

