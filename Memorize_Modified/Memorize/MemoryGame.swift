//
//  MemoryGame.swift
//  Memorize
//
//  Created by Nandini Saha on 2022-08-27.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: [Card]
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        self.cards = [Card]()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}


