//
//  Extension+String.swift
//  Pods
//
//  Created by Anderson Soares on 31/01/2018.
//
//

import Foundation

@available(iOS 9.0, *)
public extension String {
    public static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
    
    public static func randomNumbers(length: Int = 9) -> String {
        let base = "0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
    
    // formatting text for currency textField
    public func currencyInputFormattingBR() -> String {
        return currencyInputFormatting(locale:"pt_BR")
    }
    
    @available(iOS 9.0, *)
    public func currencyInputFormatting(locale:String) -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: locale )
        formatter.numberStyle = .currencyAccounting
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        
        return formatter.string(from: number)!
    }

}
