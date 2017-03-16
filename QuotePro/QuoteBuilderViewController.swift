
//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Callum Davies on 2017-03-15.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import UIKit

protocol QuoteBuilderDelegate {
    func saveQuote(quoteToBeSaved: CompletedQuote)
}

class QuoteBuilderViewController: UIViewController {
    
    
    @IBOutlet fileprivate weak var quoteViewContainer: UIView!
    
    var delegate:QuoteBuilderDelegate!
    var quoteView: QuoteView!
    var completedQuote: CompletedQuote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //load QuoteView.xib
        quoteView = Bundle.main.loadNibNamed("QuoteView",
                                             owner: nil,
                                             options: nil)?.first! as? QuoteView
        quoteView?.frame.size = quoteViewContainer.frame.size
        quoteViewContainer.addSubview(quoteView!)
        
        if (self.completedQuote != nil) {
            prepareView()
        }
    }
    
    fileprivate func prepareView() {
        
        if ((completedQuote?.quote != nil) && (completedQuote?.photo != nil)) {
            DispatchQueue.main.async {
                self.quoteView.setupWithQuote(completedQuote: self.completedQuote!)
            }
        }
    }
    
    @IBAction func newQuoteButtonPressed(_ sender: UIButton) {
        let quoteGopher = QuoteFetcher()
        quoteGopher.fetchQuote{(quote:Quote) in
            
            self.completedQuote?.quote = quote
            self.prepareView()
        }
    }
    
    @IBAction func newPhotoButtonPressed(_ sender: UIButton) {
        let photoGopher = PhotoFetcher()
        photoGopher.fetchPhoto{(photo:Photo) in
            
            self.completedQuote?.photo = photo
            self.prepareView()
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        delegate.saveQuote(quoteToBeSaved: self.completedQuote!)
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func publishButtonPressed(_ sender: UIButton) {
        
        UIGraphicsBeginImageContextWithOptions(quoteView.bounds.size, true, 0)
        quoteView.drawHierarchy(in: quoteView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let objectsToShare = [image]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    
    
}
