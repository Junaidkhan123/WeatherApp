//
//  WeatherGetSetDownload.swift
//  RainyShiny
//
//  Created by Junaid Khan on 11/03/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import Alamofire
class WeatherGetSetDownload
{
    var _cityName : String!
    var _currentDate : String!
    var _currentWeatherTemp : Double!
    var _WeatherType : String!
    // getters initilized
    var cityName : String {
        if _cityName == nil
        {
            _cityName = ""
        }
        return _cityName
    }
    var WeatherType : String {
        if _WeatherType == nil
        {
            _WeatherType = ""
        }
        return _WeatherType
    }
    var currentWeatherTemp : Double {
        if _currentWeatherTemp == nil
        {
            _currentWeatherTemp = 0.0
        }
        return _currentWeatherTemp
    }
    var currentDate : String {
        if _currentDate == nil
        {
            _currentDate = ""
        }
        let mydateFormatter = DateFormatter();
        mydateFormatter.dateStyle = .long;
        mydateFormatter.timeStyle = .none;
        let mydate = mydateFormatter.string(from: Date())
        self._currentDate  = mydate ;
        return _currentDate
    }
    func downloadCompleteDetails(completed: @escaping DownloadComplete)
    {
        let currentWeatherURL = URL(string: CURRENTWEATHERURL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result;
           if let dict = result.value as?Dictionary<String,AnyObject>
                {
                    if let name  = dict["name"] as? String
                    {
                        self._cityName = name.capitalized
                        print(self._cityName)
                }
                    if let weather = dict["weather"] as? [Dictionary<String,AnyObject>]
                    {
                        if let downlaodWeatherType = weather[0]["main"] as? String
                        {
                            self._WeatherType = downlaodWeatherType.capitalized
                            print(self._WeatherType)
                        }
                    }
                    if let  tempdict = dict["main"] as? Dictionary<String,AnyObject>
                    {
                        if let currentKelvinTemp = tempdict["temp"] as? Double
                        {
                            let kelvTOCel = currentKelvinTemp  - 273.15
                            let finalVersion = Double(round(10 * kelvTOCel / 10))
                            self._currentWeatherTemp = finalVersion;
                            print(self._currentWeatherTemp)
                        }
                    }
            }
             completed();
                   }
      
        
    }
    
    
}
