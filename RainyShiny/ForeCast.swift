//
//  ForeCast.swift
//  RainyShiny
//
//  Created by Junaid Khan on 11/03/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import Alamofire
class ForeCast {
var _forecastDate: String!
var _minTemp: Double!
var _maxTemp: Double!
var _forecastWeathrType: String!

var foreCastDate: String {
    if  _forecastDate == nil {
        _forecastDate = ""
    }
    return _forecastDate
}
var minTemp: Double{
    if _minTemp == nil {
        _minTemp = 0.0
    }
    return _minTemp
}
var maxTemp: Double{
    if _maxTemp == nil {
        _maxTemp = 0.0
    }
    return _maxTemp
}
var forecastWeathrType: String {
    if  _forecastDate == nil {
        _forecastDate = ""
    }
    return _forecastDate
}
    init(WeatherDictionary: Dictionary<String, AnyObject>) {
        if let tempForEachDay = WeatherDictionary["temp"] as? Dictionary<String,AnyObject>
        {
            if let currentKelvinTemp = tempForEachDay["min"] as? Double
            {
                let kelvTOCel = currentKelvinTemp  - 273.15
                let finalVersion0 = Double(round(10 * kelvTOCel / 10))
                self._minTemp = finalVersion0
            }
            if let currentKelvinTemp1 = tempForEachDay["max"] as? Double
            {
                 let kelvTOCel1 = currentKelvinTemp1  - 273.15
                let finalVersion1 = Double(round(10 * kelvTOCel1 / 10))
                self._maxTemp = finalVersion1;
            }
        }
        if let weather = WeatherDictionary["weather"] as? [Dictionary<String,AnyObject>]
        {
            if let downloaForeCastdWeatherType = weather[0]["main"] as? String
            {
                _forecastWeathrType = downloaForeCastdWeatherType
            }
        }
        if let dateDict = WeatherDictionary["dt"] as? Double
        {
            // date download from API is in 192922032 which is in unix so Swift has function To do convert it that Date(timeIntervakSince1970)
            let unixConvertedDate = Date(timeIntervalSince1970: dateDict)
            let mydateFormatter = DateFormatter()
            mydateFormatter.dateFormat = "EEEE"
            mydateFormatter.dateStyle = .full
            mydateFormatter.timeStyle = .none
            self._forecastDate = unixConvertedDate.dayOfWeak()
        }
    }
    init()
    {
        
    }
}
extension Date {
    func dayOfWeak() -> String
    {
        let mydateFormatter = DateFormatter()
        //EEEE is used for full name of the week
        mydateFormatter.dateFormat = "EEEE"
        return mydateFormatter.string(from: self)
    }
}
