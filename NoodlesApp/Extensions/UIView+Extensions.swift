//
//  UIView+Extensions.swift
//  NoodlesApp
//
//  Created by Rashif on 12/07/22.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
