//
//  UIColorExtension.swift
//  OpportunityMatrix
//
//  Created by Maxwell Zhou on 7/5/15.
//  Copyright © 2015 ILoveLovinda. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public convenience init(hexValue: Int) {
        /**
        String "FF" corresponds to Float 255.0 which is (2^8-1). That is 8 bits are required to represent numbers till 255
        in binary. Right shifting by 8 would give 8 bit chunks of the float value.
        */

        let red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hexValue & 0xFF00) >> 8)  / 255.0
        let blue = CGFloat(hexValue & 0xFF)            / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}