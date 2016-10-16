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
    static let conditionsKey = "conditions"
    static let iconURLKey = "icon_url"
    
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
            let conditions = dictionary[Weather.conditionsKey] as? String,
            let icon_url = dictionary[Weather.iconURLKey] as? String
        else { return nil }
        
        self.init(conditions: conditions, icon_url: icon_url)
    }
}

extension Weather: BLAPIModelUploadable
{
    var postData: Data?
    {
        return "\(Weather.conditionsKey)=\(conditions)&\(Weather.iconURLKey)=\(icon_url)".data(using: .utf8)
    }
}
