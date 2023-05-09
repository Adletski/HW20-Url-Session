//
//  API.swift
//  START-HW20
//
//  Created by Adlet Zhantassov on 09.05.2023.
//

import Foundation

struct API {
    
    static var dataCache = NSCache<NSString, CardElement>()
    
    static func callAPI(scheme: String, host: String, path: String, queryItems: [URLQueryItem], completion: @ escaping (CardElement) -> Void) {
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        print(components.url)
        
        let url = components.url
        guard let url = url else { return }
        
        if let cachedData = dataCache.object(forKey: url.absoluteString as NSString) {
            print("data taken from cache")
            completion(cachedData)
        } else {
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error {
                    print(error.localizedDescription)
                }
                
                if let response = response as? HTTPURLResponse {
                    print(response.statusCode)
                }
                
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    guard let data = data else { return }
                    let card = try? JSONDecoder().decode(Card.self, from: data)
                    
                    guard let card = card else { return }
                    let firstCard = card.cards[0]
                    self.dataCache.setObject(firstCard, forKey: url.absoluteString as NSString)
                    
                    completion(firstCard)
                }
            }
            task.resume()
        }
    }
    
}
