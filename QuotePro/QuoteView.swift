//
//  QuoteView.swift
//  QuotePro
//
//  Created by Pierre Binon on 2017-04-11.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

import UIKit



class QuoteView: UIView {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func setupWithQuote(completedQuote:CompletedQuote) -> Void {
        
        photoView.image = completedQuote.photo.photo
        
        quoteLabel.text = completedQuote.quote.quoteText
        quoteLabel.shadowColor = UIColor.darkGray
        
        authorLabel.text = completedQuote.quote.quoteAuthor
        authorLabel.shadowColor = UIColor.darkGray
    }
}
