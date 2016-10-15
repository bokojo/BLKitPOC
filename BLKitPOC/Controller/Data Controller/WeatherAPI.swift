//
//  WeatherAPI.swift
//  BLKitPOC
//
//  Created by Burton Lee on 10/14/16.
//  Copyright © 2016 Buffalo Ladybug LLC. All rights reserved.
//

import Foundation
import BLKit

class WeatherAPI
{
    let WeatherUndergroundAPIKey = "5edc947d9938f768"
    let apiController: BLAPIController
    
    // http://api.wunderground.com/api/5edc947d9938f768/forecast/q/CA/San_Francisco.json
    
    init()
    {
        apiController = BLAPIController(host: "https://api.wunderground.com/")
    }
    
    // MARK: - API DEFINITIONS -
    // MARK: GET - /thing/[id]
    
    func getSFWeather(success: @escaping (([AnyObject]) -> Void), failure: ((NSError?) -> Void)?) -> URLSessionDataTask?
    {
        
        let parameters = BLAPIController.APIParameters(
            
            urlString: "\(apiController.host)api/\(WeatherUndergroundAPIKey)/forecast/q/CA/San_Francisco.json",
            successClosure: success,
            failureClosure: failure,
            type: Weather.self,
            jsonKey: "forecast.simpleforecast.forecastday",
            queueOnFailure: .LastUniqueRequest
        )
        
        return apiController.serverInteractionBy(parameters: parameters)

    }
}
