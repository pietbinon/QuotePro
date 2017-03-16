//
//  QuoteFetcher.swift
//  QuotePro
//
//  Created by Callum Davies on 2017-03-15.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import Foundation

struct QuoteService
{
    func fetchQuote(completionHandler: @escaping (String, String) -> Void)
    {
        
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        let session = URLSession.shared
        session.dataTask(with: url!, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
        
            guard let realResponse = response as? HTTPURLResponse,
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            //parse JSON
            do {
                let jsonData: NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                let quote = jsonData["quoteText"] as! String
                let author = jsonData["quoteAuthor"] as! String
                
                completionHandler(quote, author)

                
            } catch {
                print(error)
            }
    }).resume()
    }
}
