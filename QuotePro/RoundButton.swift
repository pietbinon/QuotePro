//
//  RoundButton.swift
//  QuotePro
//
//  Created by Pierre Binon on 2017-04-12.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import UIKit

@IBDesignable



class RoundButton: UIButton {

    //cornerRadius
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        
        didSet {
            
            self.layer.cornerRadius = cornerRadius
        }
    }

    
    //borderWidth
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        
        didSet {
            
            self.layer.borderWidth = borderWidth
        }
    }

    
    //borderColor
    @IBInspectable var borderColor: UIColor = .clear {
        
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
