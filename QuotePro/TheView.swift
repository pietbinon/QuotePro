//
//  TheView.swift
//  QuotePro
//
//  Created by Pierre Binon on 2017-04-12.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import UIKit



class TheView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let photo = Photos (with: imageView.image!)
        let userInfo = ["key" : photo]
        NotificationCenter.default.post(name: NSNotification.Name (rawValue: "PhotoObjectCreatedNotification"), object: nil, userInfo: userInfo)
    }
}
