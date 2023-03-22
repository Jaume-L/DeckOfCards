//
//  DeckOfCards.swift
//  DeckOfCards
//
//  Created by Jaume, Louis (NA) on 22/03/2023.
//

import Foundation

class CardGameHandler {
    let baseUrl = "https://deckofcardsapi.com"
    
    func getDeck() {
        let path = "/api/deck/new/"
        
        guard let url = URL(string: baseUrl + path)
        else {
            print("bad url")
            return
        }
        let request = URLRequest(url:url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    print(response.deck_id)
                } else {
                    print("nil")
                }
            }
        }.resume()
        
    }
    
    func parseJson(json: Data) -> Deck? {
        let decoder = JSONDecoder()
        
        if let deck = try? decoder.decode(Deck.self, from: json) {
            return deck
        } else {
            print("error in json")
            return nil
        }
    }
    
    
    
}
