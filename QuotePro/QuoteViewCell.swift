//
//  QuoteViewCell.swift
//  QuotePro
//
//  Created by Callum Davies on 2017-03-15.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import UIKit

class QuoteViewCell: UITableViewCell {
    
    @IBOutlet weak var quoteImageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var completedQuote: CompletedQuote! {
        didSet {
            configure()
        }
    }
    
    fileprivate func configure() {
        
        self.quoteImageView.image = completedQuote.photo.photo
        self.quoteLabel.text = completedQuote.quote.quoteText
        self.authorLabel.text = completedQuote.quote.quoteAuthor
    }
}
