//
//  Weather.swift
//  BLKitPOC
//
//  Created by Burton Lee on 10/14/16.
//  Copyright © 2016 Buffalo Ladybug LLC. All rights reserved.
//

import Foundation
import BLKit

struct Weather: BLAPIModel
{
    
    let conditions: String
    let icon_url: String
    
    init(conditions: String, icon_url: String)
    {
        self.conditions = conditions
        self.icon_url = icon_url
    }
    
    init?(dictionary: [AnyHashable : Any])
    {
        guard
            let conditions = dictionary["conditions"] as? String,
            let icon_url = dictionary["icon_url"] as? String
        else { return nil }
        
        self.init(conditions: conditions, icon_url: icon_url)
    }
}
