//
//  ApiResponse.swift
//  Yummie
//
//  Created by Emmanuel Okwara on 01/05/2021.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let succeeded: Bool?
    let message: String?
    let data: T?
    let errors: String?
}
