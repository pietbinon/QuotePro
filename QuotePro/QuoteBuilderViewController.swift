
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //check if completedQuote property exists,
        //      if yes {
        //              load previous thing
        //              prepareView
        //      if no {
        //              start downloading
    }

    fileprivate func prepareView() {
        
    }
    
    @IBAction func newQuoteButtonPressed(_ sender: UIButton) {
        //QuoteFetcher fetchQuote
    }
    
    @IBAction func newPhotoButtonPressed(_ sender: UIButton) {
        //PhotoFetcher fetchPhoto
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        //self.delegate save to arrayOfCompletedQuotes
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
