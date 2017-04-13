//
//  QuoteFetcher.swift
//  QuotePro
//
//  Created by Pierre Binon on 2017-04-11.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

import Foundation



class QuoteFetcher {
    
    func fetchQuote(completionHandler: @escaping (Quote) -> Void) {
        
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en")
        let session = URLSession(configuration:URLSessionConfiguration.default)
        let dataTask = session.dataTask(with: url!, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            guard let data = data else {
                
                print("No data, \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let realResponse = response as? HTTPURLResponse,
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            var jsonObject:[String: String]?
            
            do { jsonObject = try JSONSerialization.jsonObject(with: data) as? Dictionary<String, String> }
            catch { print(error.localizedDescription) }
            
            guard let json = jsonObject else {
                print("Error with JSON!")
                return
            }
            
            let newQuote = Quote()
            newQuote.quoteAuthor = json["quoteAuthor"]!
            newQuote.quoteText = json["quoteText"]!
            
            completionHandler(newQuote)
            
        })
        
        dataTask.resume()
    }
}
