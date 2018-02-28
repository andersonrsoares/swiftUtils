//
//  CheckBox.swift
//  ASswiftUtils
//
//  Created by Anderson Soares on 27/02/2018.
//

import Foundation

@IBDesignable
public class CheckBox: UIButton {

    @IBInspectable var checked:    Bool =  false { didSet { setCheckedImage() }}
    @IBInspectable var checkboxChecked = "checkbox_checked.png"
    @IBInspectable var checkboxUnchecked = "checkbox_unchecked.png"

    public func setCheckedImage() {
        do{
            if self.checked == false {
                self.setImage(UIImage(named: checkboxUnchecked)!, for: UIControlState())
            } else {
                self.setImage(UIImage(named: checkboxChecked)!, for: UIControlState())
            }
        }catch{
            
        }
      
    }
    
    @objc public func checkBoxClicked() {
        self.checked = !self.checked
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        customInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        customInit()
    }
    
    fileprivate func customInit() {
        self.contentHorizontalAlignment = .left
        checked = false
        self.addTarget(self, action: #selector(self.checkBoxClicked), for: .touchUpInside)
    }
    
}
