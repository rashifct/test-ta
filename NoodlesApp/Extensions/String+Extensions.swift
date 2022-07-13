//
//  String+Extensions.swift
//  Test MVVM
//
//  Created by Rashif on 11/07/22.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
