//
//  SetGame.swift
//  SetGame1
//
//  Created by Sang To on 9/10/19.
//  Copyright © 2019 Grace To. All rights reserved.
//

import Foundation

class SetGame {
    
    var deck: [Card] = []
    var indexOfCardOne: Int?
    var indexOfCardTwo: Int?
    var count = 0
    var score = 0
    
    init() {
        newGame()
    }
    
    private func createDeck() {
        for p in Pattern.iList {
            for q in Quantity.iList {
                for c in Shade.iList {
                    for f in Fill.iList {
                        let card = Card(pattern: p, quantity: q, shade: c, fill: f, unhide: false, selected: false, isMatched: false)
                        deck.append(card)
                    }
                }
            }
        }
    }

    func newGame() {
        // Create a new game
        score = 0
        deck = [Card]()
        createDeck()
        deck = deck.shuffled()
    }
    
    func getCard(index:Int)->Card
    {
        return deck[index]
    }
    
    func chooseCard(at index: Int) -> Int{
        if deck[index].unhide {
            if let index1 = indexOfCardOne, let index2 = indexOfCardTwo, index != index1, index1 != index2, index != index2 {
                if isSet(card1: deck[index], card2: deck[index1], card3: deck[index2]) {
                    deck[index].isMatched = true
                    deck[index1].isMatched = true
                    deck[index2].isMatched = true
                    deck.remove(at: index)
                    deck.remove(at: index1)
                    deck.remove(at: index2)
                }
                deck[index].selected = true
                deck[index1].selected = true
                deck[index2].selected = true
                indexOfCardOne = nil
                indexOfCardTwo = nil
            } else {
                if indexOfCardOne != nil {
                    indexOfCardOne = index
                } else {
                    indexOfCardTwo = index
                }
            }
            
        }
        count += 1
        return count
    }
    
    func isSet(card1 c1: Card,card2 c2: Card,card3 c3: Card) -> Bool {
        // if all are match or all are different then it's a set
        if !((c1.pattern == c2.pattern && c2.pattern == c3.pattern && c1.pattern == c3.pattern) || (c1.pattern != c2.pattern && c2.pattern != c3.pattern && c1.pattern != c3.pattern)) {
            return false
        }
        if !((c1.quantity == c2.quantity && c2.quantity == c3.quantity && c1.quantity == c3.quantity) || (c1.quantity != c2.quantity && c2.quantity != c3.quantity && c1.quantity != c3.quantity)) {
            return false
        }
        if !((c1.shade == c2.shade && c2.shade == c3.shade && c1.shade == c3.shade) || (c1.shade != c2.shade && c2.shade != c3.shade && c1.shade != c3.shade)) {
            return false
        }
        if !((c1.fill == c2.fill && c2.fill == c3.fill && c1.fill == c3.fill) || (c1.fill != c2.fill && c2.fill != c3.fill && c1.fill != c3.fill)) {
            return false
        }
        return true
    }
    
    func countScore() -> Int {
        //TODO
        return score
    }
    
}

