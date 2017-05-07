//
//  Constants.swift
//  RainyShiny
//
//  Created by Junaid Khan on 10/03/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

    let BASEURL = "http://api.openweathermap.org/data/2.5/weather?"
    let LAT = "lat="
    let LONGT = "&lon="
    let APP_ID = "&appid="
    let API_KEY = "860a45f98f04e3bc4ff2794d87281e6d"
    let CURRENTWEATHERURL = "\(BASEURL)\(LAT)33.7182\(LONGT)73.0605\(APP_ID)\(API_KEY)";
    var FORECASTURL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=33.7182&lon=73.0605&cnt=10&appid=860a45f98f04e3bc4ff2794d87281e6d"

typealias DownloadComplete = () ->();

