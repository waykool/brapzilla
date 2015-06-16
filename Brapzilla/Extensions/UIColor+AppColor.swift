//
//  UIColorExtensions.swift
//  Brapzilla
//
//  Created by Pedro Peres on 5/4/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {

    convenience init(rgba: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0

        if rgba.hasPrefix("#") {
            let index   = advance(rgba.startIndex, 1)
            let hex     = rgba.substringFromIndex(index)
            let scanner = NSScanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexLongLong(&hexValue) {
                switch (count(hex)) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8")
                }
            } else {
                println("Scan hex error")
            }
        } else {
            print("Invalid RGB string, missing '#' as prefix")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }

    class func brapBlueColor() -> UIColor {
        return UIColor(rgba: "#337fcc")
    }

    class func brapOrangeColor() -> UIColor {
        return UIColor(rgba: "#fa9d4c")
    }

    class func brapGreenColor() -> UIColor {
        return UIColor(rgba: "#b1bc39")
    }

    class func brapRedColor() -> UIColor {
        return UIColor(rgba: "#c64c58")
    }

    class func brapWhiteColor() -> UIColor {
        return UIColor(rgba: "#f4f4f8")
    }

    class func brapLightGrayColor() -> UIColor {
        return UIColor(rgba: "#c1c4d6")
    }

    class func brapBlackColor() -> UIColor {
        return UIColor(rgba: "#363951")
    }

    class func brapLighterBlackColor() -> UIColor {
        return UIColor(rgba: "#4a4f70")
    }

    class func brapDarkBackgroundColor() -> UIColor {
        return brapBlackColor()
    }

    class func brapWhiteTextColor() -> UIColor {
        return brapWhiteColor()
    }

    class func brapLightBackgroundColor() -> UIColor {
        return brapWhiteColor()
    }

    class func brapBrandColor() -> UIColor {
        return UIColor.brapBlueColor()
    }
}