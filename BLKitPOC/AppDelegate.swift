//
//  AppDelegate.swift
//  BLKitPOC
//
//  Created by Burton Lee on 10/14/16.
//  Copyright © 2016 Buffalo Ladybug LLC. All rights reserved.
//

import UIKit
import BLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let weatherAPI = WeatherAPI()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
}

