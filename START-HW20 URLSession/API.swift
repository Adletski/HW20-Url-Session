//
//  API.swift
//  START-HW20
//
//  Created by Adlet Zhantassov on 09.05.2023.
//

import Foundation

struct API {
    
    static func callAPI(scheme: String, host: String, path: String, queryItems: [URLQueryItem], completion: @ escaping (CardElement) -> Void) {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        print(components.url)
        let url = components.url
        guard let url = url else { return }
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
                
                completion(firstCard)
            }
        }
        task.resume()
    }
    
}
