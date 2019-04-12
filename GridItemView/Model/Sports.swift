//
//  Sport.swift
//  GridItemView
//
//  Created by Fran (A610851) on 11/04/2019.
//  Copyright © 2019 Fran (A610851). All rights reserved.
//

import Foundation

struct Sports: Codable {
    let sports: [[Sport]]
    
    enum CodingKeys: String, CodingKey {
        case sports = "Sports"
    }
}

struct Sport: Codable {
    let id, name, image: String
}
