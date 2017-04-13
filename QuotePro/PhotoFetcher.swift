//
//  PhotoFetcher.swift
//  QuotePro
//
//  Created by Pierre Binon on 2017-04-11.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

import Foundation
import UIKit


class PhotoFetcher {
    
    func fetchPhoto(completionHandler: @escaping (Photo) -> Void) {
        
        let url = URL(string: "http://lorempixel.com/200/300/nature")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration:URLSessionConfiguration.default)
        
        let dataTask = session.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            guard let data = data else {
                
                print("no data returned from \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let realResponse = response as? HTTPURLResponse,
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            let newPhoto = Photo()
            newPhoto.photo = UIImage(data: data)!
            
            completionHandler(newPhoto)
        }
        
        dataTask.resume()
    }    
}

