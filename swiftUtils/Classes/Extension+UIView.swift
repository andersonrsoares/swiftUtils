//
//  Extension+UIView.swift
//  Pods
//
//  Created by Anderson Soares on 24/01/2018.
//

import Foundation
import UIKit

public extension UIView {
    
    // you cannot create actions with UIViews. Therefore, use this gesture recognizer.
    public func addTapGesture(_ target: AnyObject, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = 1
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
    public func requiredAnimation() {
        self.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            UIView.setAnimationRepeatCount(3)
            self.alpha = 1
        }, completion: nil)
    }
    
    public var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    @IBInspectable public var shadowOffset: CGSize{
        get{
            return self.layer.shadowOffset
        }
        set{
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable public var shadowOpacity: Double {
        get {
            return Double(self.layer.shadowOpacity)
        }
        set {
            self.layer.shadowOpacity = Float(newValue)
        }
    }
    
    @IBInspectable public var shadowRadius: Double {
        get {
            return Double(self.layer.shadowRadius)
        }
        set {
            self.layer.shadowRadius = CGFloat(newValue)
        }
    }
    

    @IBInspectable public var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    
    @IBInspectable public var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    
    @IBInspectable public var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
}
