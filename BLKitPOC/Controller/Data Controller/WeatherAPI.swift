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
    
    init()
    {
        apiController = BLAPIController(host: "https://api.wunderground.com/")
    }
    
    // MARK: - API DEFINITIONS -
    // MARK: - GET
    // http://api.wunderground.com/api/5edc947d9938f768/forecast/q/CA/San_Francisco.json
    
    func getSFWeather(success: @escaping (([Any]) -> Void), failure: ((Error?) -> Void)?) -> URLSessionTask?
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
    
    // MARK: - POST 
    
    func postSFWeather(success: @escaping (([Any]) -> Void), failure: ((Error?) -> Void)) -> URLSessionTask?
    {
        let parameters = BLAPIController.APIParameters(
            urlString: "Moo",
            type: Weather.self
        )
        
        return apiController.serverInteractionBy(parameters: parameters)
    }
    
}
