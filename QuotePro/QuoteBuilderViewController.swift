
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
    
    var quoteView: QuoteView?
    var completedQuote: CompletedQuote?
    var modifyingOriginalQuote: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteView = Bundle.main.loadNibNamed("QuoteView",
                                             owner: nil,
                                             options: nil)?.first! as? QuoteView
        
        quoteView?.frame.size = quoteViewContainer.frame.size
        quoteViewContainer.addSubview(quoteView!)
        
        //check if completedQuote property exists,
        //      if yes {
        //              load previous thing
        //              modifyingOriginalQuote = true;
        //              prepareView
        //      if no {
        //              start downloading
    }

    fileprivate func prepareView() {
        
    }
    
    @IBAction func newQuoteButtonPressed(_ sender: UIButton) {
        let quoteGopher = QuoteFetcher()
        quoteGopher.fetchQuote{(quote:Quote) in
            
            DispatchQueue.main.async {
                self.completedQuote?.quote = quote
            }
        }
    }
    
    @IBAction func newPhotoButtonPressed(_ sender: UIButton) {
        let photoGopher = PhotoFetcher()
        photoGopher.fetchPhoto{(photo:Photo) in
            
            DispatchQueue.main.async {
                self.completedQuote?.photo = photo
            }
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
