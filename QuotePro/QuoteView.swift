//
//  QuoteView.swift
//  QuotePro
//
//  Created by Callum Davies on 2017-03-15.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import UIKit

class QuoteView: UIView {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func setupWithQuote(completedQuote:CompletedQuote) -> Void {
        
        photoView.image = completedQuote.photo.photo
        
        quoteLabel.text = completedQuote.quote.quoteText
        quoteLabel.shadowColor = UIColor.lightGray
        
        authorLabel.text = completedQuote.quote.quoteAuthor
        authorLabel.shadowColor = UIColor.lightGray
        
    }

}
