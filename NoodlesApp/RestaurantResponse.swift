//
//  RestaurantResponse.swift
//  NoodlesApp
//
//  Created by Rashif on 12/07/22.
//

import Foundation

struct RestaurantResponseElement: Codable {
    let brand, variety, style, country: String
    let stars: Stars
    let topTen: String

    enum CodingKeys: String, CodingKey {
        case brand = "Brand"
        case variety = "Variety"
        case style = "Style"
        case country = "Country"
        case stars = "Stars"
        case topTen = "Top Ten"
    }
}

enum Stars: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Stars.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Stars"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

typealias RestaurantResponse = [RestaurantResponseElement]
