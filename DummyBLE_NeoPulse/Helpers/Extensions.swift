//
//  Extensions.swift
//  DummyBLE_NeoPulse
//
//  Created by Abhishek Chaudhari on 25/08/18.
//  Copyright © 2018 Abhishek Chaudhari. All rights reserved.
//
import Foundation
import UIKit

extension UIView {
    func addBorder(cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}

extension UIFont {
    
    class var titleFont: UIFont {
        return UIFont.systemFont(ofSize: 27.0, weight: .medium)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    class var greyishBG: UIColor {
        return UIColor(rgb: 0xF2F2F2)
    }
    class var blueHR: UIColor {
        return UIColor(rgb: 0x1DAFEC)
    }
    class var chartLine: UIColor {
        return UIColor(rgb: 0x7577AA)
    }
    class var chartDot: UIColor {
        return UIColor(rgb: 0x1DAFEC)
    }
}
