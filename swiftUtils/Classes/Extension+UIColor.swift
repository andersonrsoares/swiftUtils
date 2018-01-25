//
//  Extensions+color.swift
//  Pods
//
//  Created by Anderson Soares on 24/01/2018.
//

import Foundation
import UIKit

public extension UIColor {
    
    public class func randomColor() -> UIColor {
        
        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    
    public static func hexToColor(hex: String) -> UIColor {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        
        return UIColor(red:CGFloat(r) / 0xff,green: CGFloat(g) / 0xff,blue: CGFloat(b) / 0xff, alpha: 1.0)
    }
    
    public static func colorToHex(color:UIColor) -> String{
        let ci = CIColor.init(cgColor: color.cgColor)
        return String(format: "%02X%02X%02X",Int(ci.red * 0xff),Int(ci.green * 0xff),Int(ci.blue * 0xff))
    }
    
}
