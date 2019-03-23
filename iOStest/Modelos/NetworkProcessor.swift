//
//  NetworkProcessor.swift
//  APITest
//
//  Created by Said Sarabia Saavedra on 3/7/19.
//  Copyright © 2019 Said Sarabia. All rights reserved.
//

import Foundation

class NetworkProcessor
{
    lazy var configuracion: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var sesion: URLSession = URLSession(configuration: self.configuracion)
    
    let url: URL
    init(url:URL)
    {
        self.url = url
    }
    
    typealias JSONDictionaryHandler = (([[String: Any]]?) -> Void)
    
    func JSONDownloadfromURL(_ completion: @escaping JSONDictionaryHandler)
    {
        let request = URLRequest(url: self.url)
        let dataTask = sesion.dataTask(with: request) { (data, response, error) in
            
            if error == nil{
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode{
                    case 200:
                        //succesful
                        if let data = data{
                             do
                            {
                                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .allowFragments])
                                completion(jsonDictionary as? [[String: Any]])
                                
                                
                            }catch let error as NSError{
                                print("Error processing json data \(error.localizedDescription)")
                            }
                            
                            print(data)
                        }
                            
                    default:
                        print("HTTP Response Code: \(httpResponse.statusCode)")
                    }
                }
                
            }else{
                print("Error: \(String(describing: error?.localizedDescription))")
        }
    }
        dataTask.resume()
  }
}
