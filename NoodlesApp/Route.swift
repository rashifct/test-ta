//
//  Route.swift
//  Yummie
//
//  Created by Emmanuel Okwara on 30/04/2021.
//

import Foundation

enum Route {
    static let baseUrl = "https://s3-ap-southeast-1.amazonaws.com/he-public-data/"
    
    case fetchRestuarants
    case fetchNooodlesImages
    
    var description: String {
        switch self {
        case .fetchRestuarants:
            return "TopRamen8d30951.json"
            
        case .fetchNooodlesImages:
            return "noodlesec253ad.json"
        }
    }
}
