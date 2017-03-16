//
//  QuoteViewCell.swift
//  QuotePro
//
//  Created by Callum Davies on 2017-03-15.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import UIKit

class QuoteViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var quoteImageView: UIImageView!
    @IBOutlet fileprivate weak var quoteLabel: UILabel!
    @IBOutlet fileprivate weak var authorLabel: UILabel!
    
    var completedQuote: CompletedQuote! {
        didSet {
            configure()
        }
    }
    
    fileprivate func configure() {
        
        self.quoteImageView.image = completedQuote.photo.photo
        self.quoteLabel.text = String(format: "%@", completedQuote.quote.quoteText!)
        self.authorLabel.text = String(format: "-%@",completedQuote.quote.quoteAuthor!)
    }
}
