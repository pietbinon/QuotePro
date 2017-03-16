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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makeSampleQuote()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCompletedQuotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as! QuoteViewCell
            //QuoteViewCell(style: .default, reuseIdentifier: "quoteCell")
//
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
}

