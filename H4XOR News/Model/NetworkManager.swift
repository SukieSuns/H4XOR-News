//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Administrator on 12/24/22.
//

import Foundation

class NetworkManager:ObservableObject {
    
    @Published var posts = [Post]()
    
    func fenchData(){
        
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data,response,error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.sync {
                                self.posts = results.hits
                            }
                        }catch{
                            print(error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
    
}
