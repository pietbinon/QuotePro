//
//  MasterViewController.swift
//  QuotePro
//
//  Created by Callum Davies on 2017-03-15.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var arrayOfCompletedQuotes : [CompletedQuote] = []
    var completedQuoteToShow: CompletedQuote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makeSampleQuote()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCompletedQuotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as! QuoteViewCell
        let selectedQuote = arrayOfCompletedQuotes[indexPath.row]
        cell.completedQuote = selectedQuote
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func makeSampleQuote() {
        let sampleQuote = CompletedQuote()
        sampleQuote.photo.photo = UIImage(named: "forceofnature")!
        sampleQuote.quote.quoteText = "lol"
        sampleQuote.quote.quoteAuthor = "mr. T"
        arrayOfCompletedQuotes.append(sampleQuote)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.completedQuoteToShow = self.arrayOfCompletedQuotes[indexPath.row]
        self.performSegue(withIdentifier: "goToQuoteBuilder", sender: self)
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goToQuoteBuilder", sender: sender)
        //don't set completedQuote property
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var builderVC = QuoteBuilderViewController()
        builderVC = segue.destination as! QuoteBuilderViewController
        if sender is UIBarButtonItem {
            builderVC.completedQuote = nil
        } else {
            builderVC.completedQuote = self.completedQuoteToShow
        }
    }
}

