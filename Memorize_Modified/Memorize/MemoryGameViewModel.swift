//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by Nandini Saha on 2022-08-27.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    
    private var indexofTheOneAndOnlyFaceUpCard: Int?
    
    static let emojis = ["✈️","🚞","🚌","⛴","💰","🏏","😈","🔮","🤡","🐠","🍅","🍇","🍓","🥬","🥦","🍆","🫐","🪀","🚘","🚍","🚜","🚚","🚓","🚗"]
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairOfCards: 4) { pairIndex in
            return emojis[pairIndex]
        }
    }

    @Published private (set) var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    //Mark: Intent
    
    //func choose(_ card: MemoryGame<String>.Card) {
     //   model.choose(card)
    //}
    
    func choose(_ card: MemoryGame<String>.Card) {
       // if let choosenIndex = index(of: card) {
        if let chosenIndex = model.cards.firstIndex(where: { $0.id == card.id }),
           !model.cards[chosenIndex].isFaceUp,
           !model.cards[chosenIndex].isMatched
        {
            if let potentialMatch = indexofTheOneAndOnlyFaceUpCard {
                if model.cards[chosenIndex].content == model.cards[potentialMatch].content {
                    model.cards[chosenIndex].isMatched = true
                    model.cards[potentialMatch].isMatched = true
                }
                indexofTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    model.cards[index].isFaceUp = false
                }
                indexofTheOneAndOnlyFaceUpCard = chosenIndex
            }
            model.cards[chosenIndex].isFaceUp.toggle()
        }
       // }
        print("\(cards)")
    }}
