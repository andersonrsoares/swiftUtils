//
//  Extension+UIViewController.swift
//  Pods
//
//  Created by Anderson Soares on 31/01/2018.
//
//

import Foundation

public extension UIViewController {
    
    @IBAction public func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func showAlert(title: String!,
                   message : String!,
                   dismissAfter secs: Double = 0.0,
                   buttonTitle btitle: String = "OK",
                   completion: @escaping () -> Void = {}) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        if secs == 0 {
            let ok = UIAlertAction(title: btitle, style: .default, handler: {action in  completion() })
            alertController.addAction(ok)
        }
        
        self.present(alertController, animated: true, completion: nil)
        
        
        if secs > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + secs) {
                alertController.dismiss(animated: true, completion: { completion() })
            }
        }
    }
    
    
}
