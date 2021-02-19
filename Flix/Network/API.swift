//
//  API.swift
//  Flix
//
//  Created by Matthew Kaneda on 2/10/21.
//

import Foundation

struct API {



    static func getMovies(completion: @escaping ([[String:Any]]?) -> Void) {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
        
        if let error = error {
          print(error.localizedDescription)
        } else if let data = data {
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            print(dataDictionary)
            
            let dict = dataDictionary["results"] as! [[String: Any]]
            
            return completion(dict)
            
            

              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()
    }
    
    static func getMovieGrid(completion: @escaping ([[String: Any]]?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
        
        if let error = error {
          print(error.localizedDescription)
        } else if let data = data {
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            print(dataDictionary)
            
            let dict = dataDictionary["results"] as! [[String: Any]]
            
            return completion(dict)
            
            

              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data
           }
        }
        task.resume()
    }
}

//        let task = session.dataTask(with: request) { (data, response, error) in
//            // This will run when the network request returns
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//
//
//
//                // ––––– TODO: Get data from API and return it using completion
//                print(data)
//
//                let dataDict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//
//                let restaurants = dataDict["businesses"] as! [[String: Any]]
//
//                return completion(restaurants)
//
//
//                }
//            }
//
//            task.resume()
