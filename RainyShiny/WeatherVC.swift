//
//  WeatherVC.swift
//  RainyShiny
//
//  Created by Junaid Khan on 10/03/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import Alamofire
class WeatherVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
@IBOutlet weak var myCurrentDate: UILabel!
@IBOutlet weak var myCurrentTempreture: UILabel!
@IBOutlet weak var myCurrentCity: UILabel!
    @IBOutlet weak var myCurrentWeatherType: UILabel!
@IBOutlet weak var myCurrentWeatherView: UIImageView!
@IBOutlet weak var myWeatherTable: UITableView!
// classes Memeber
var memberWeatherGetSetClass : WeatherGetSetDownload!
var memberForcast: ForeCast!
    // Array of ForeCastClass
    var forecastArray = [ForeCast]()
    override func viewDidLoad()
{
    super.viewDidLoad()
    myWeatherTable.delegate = self ;
    myWeatherTable.dataSource = self;
    print(CURRENTWEATHERURL)
    memberWeatherGetSetClass = WeatherGetSetDownload()
    memberForcast =  ForeCast();
    memberWeatherGetSetClass.downloadCompleteDetails{
        self.forecastDataDownloadDetails {
            self.UPdateUI()
        }
    
    
    }
}

 func forecastDataDownloadDetails(Completed: @escaping DownloadComplete)
 {
    let forecastURL = URL(string: FORECASTURL)!
    Alamofire.request(forecastURL).responseJSON{ response in
        let result = response.result
        if let dict = result.value as? Dictionary<String,AnyObject>
        {
        if let list = dict["list"] as? [Dictionary<String, AnyObject>]
        {
            for obj in list {
                // object is the each dictonary in the list for every day
                //create the initializer for ForeCast Class and pass that Dictionary to constructor and that dictionary will be stored in passingForeCast and then result stored in the PassingForecast will be passed to the array
                let passingForcast = ForeCast(WeatherDictionary: obj)
                self.forecastArray.append(passingForcast)
                print(obj)
            }
            self.forecastArray.remove(at: 0)
            self.myWeatherTable.reloadData()
            }
        }
        Completed();
    }
 }

func numberOfSections(in tableView: UITableView) -> Int {
    return 1
}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return forecastArray.count
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = myWeatherTable.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell
        {
            let passingForCastToCell = forecastArray[indexPath.row]
            cell.congigureCell(forecast: passingForCastToCell)
              return cell
    }
        else {
            return WeatherCell()
    }
    }

    func UPdateUI()
    {
        if let temp1 = memberWeatherGetSetClass._cityName
        {
            myCurrentCity.text = temp1;
        }
        
        if let temp2 = memberWeatherGetSetClass._currentWeatherTemp
        {
            myCurrentTempreture.text = "\(temp2) °C";
        }
        if let temp3 = memberWeatherGetSetClass._currentDate
        {
            myCurrentDate.text = "Today,\(temp3)"
        }
        if let temp4 = memberWeatherGetSetClass._WeatherType
        {
            myCurrentWeatherType.text = temp4;
            myCurrentWeatherView.image = UIImage(named: temp4)
        }
        
    }
}
