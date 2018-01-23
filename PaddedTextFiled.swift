//
//  PaddedTextFiled.swift
//  DemoApp
//
//  Created by Rajesh on 20/01/18.
//  Copyright © 2018 medipod. All rights reserved.
//

import UIKit

 @IBDesignable final class PaddedTextFiled: UITextField {

    @IBInspectable var horizontalPadding: CGFloat = 10
    @IBInspectable var veticalPadding: CGFloat = 10
   // var Id : String = ""
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + horizontalPadding, y: bounds.origin.y + veticalPadding , width: bounds.width - (2*horizontalPadding), height: bounds.height - (2*veticalPadding))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + horizontalPadding, y: bounds.origin.y + veticalPadding, width: bounds.width - (2*horizontalPadding), height: bounds.height - (2*veticalPadding))
    }
}
