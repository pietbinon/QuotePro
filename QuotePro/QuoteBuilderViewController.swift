
//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Callum Davies on 2017-03-15.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {
    
    
    @IBOutlet fileprivate weak var quoteViewContainer: UIView!
    
    var quoteView: QuoteView!
    var completedQuote: CompletedQuote?
//    var modifyingOriginalQuote: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load QuoteView.xib
        quoteView = Bundle.main.loadNibNamed("QuoteView",
                                             owner: nil,
                                             options: nil)?.first! as? QuoteView
        quoteView?.frame.size = quoteViewContainer.frame.size
        quoteViewContainer.addSubview(quoteView!)
        
        if (self.completedQuote != nil) {
            //modifyingOriginalQuote = true;
            prepareView()
            
        } else {
            //START ZE DOWNLOAD
        }
        
    }
    
    fileprivate func prepareView() {
        DispatchQueue.main.async {
            self.quoteView.setupWithQuote(completedQuote: self.completedQuote!)
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
        //self.delegate save to arrayOfCompletedQuotes
        //if modifyingOriginalQuote - arrayOfCompletedQuotes
        //self dismissViewController
    }
    
    @IBAction func publishButtonPressed(_ sender: UIButton) {
        //publish to social mediaz
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
