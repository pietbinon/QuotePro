//
//  PhotoFetcher.swift
//  QuotePro
//
//  Created by Callum Davies on 2017-03-15.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import Foundation
import UIKit
//import Nuke?

class PhotoFetcher
{
    func fetchPhoto(completionHandler: @escaping (Photo) -> Void) {
        
        let url = URL(string: "http://lorempixel.com/300/300")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration:URLSessionConfiguration.default)
        
        let dataTask = session.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            guard let data = data else
            {
                print("no data returned from \(error?.localizedDescription)")
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

