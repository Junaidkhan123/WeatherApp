//
//  WeatherCell.swift
//  RainyShiny
//
//  Created by Junaid Khan on 11/03/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var myCellHighTemp: UILabel!
    @IBOutlet weak var myCellMinTemp: UILabel!
    @IBOutlet weak var myCellWeatherType: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var myCellImage: UIImageView!
   
        func congigureCell(forecast: ForeCast)
        {
            if let temp1 = forecast._forecastWeathrType
            {
                myCellImage.image = UIImage(named: temp1 )
                myCellWeatherType.text = temp1
            }
           if let temp2 = forecast._maxTemp
           {
            myCellMinTemp.text = "\(temp2)"
            
            }
            if let temp3 = forecast._minTemp
            {
                 myCellHighTemp.text  = "\(temp3)"
            }
          
         
            
           
         if let temp4 = forecast._forecastDate
         {
            dayLabel.text = temp4
            }
           
        }
}
