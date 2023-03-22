//
//  StateController.swift
//  DeckOfCards
//
//  Created by Jaume, Louis (NA) on 22/03/2023.
//

import Foundation

class StateController: ObservableObject {
    let gameHandler = CardGameHandler()
    
    @Published var deck_id: String = "" {
        didSet {
            gameHandler.getDeck()
        }
    }
    
}
