//
//  NoodlesImageResponse.swift
//  NoodlesApp
//
//  Created by Rashif on 12/07/22.
//

import Foundation

struct NoodlesImageResponseElement: Codable {
    let image: String

    enum CodingKeys: String, CodingKey {
        case image = "Image"
    }
}

typealias NoodlesImageResponse = [NoodlesImageResponseElement]
