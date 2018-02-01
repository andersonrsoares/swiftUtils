//
//  Extension+UITextField.swift
//  Pods
//
//  Created by Anderson Soares on 31/01/2018.
//
//

import Foundation

public extension UITextField {
    public func isEmpty(animate: Bool = false) -> Bool {
        let empty = self.text?.count == 0
        if animate == true && empty == true {
            self.requiredAnimation()
        }
        return empty
    }
    
    @IBInspectable public var placeholderColor: UIColor? {
        get {
            return self.placeholderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(
                string: self.placeholder != nil ? (self.placeholder)! : "",
                attributes: [NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
    
    
}
