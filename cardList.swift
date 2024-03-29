//
//  cardList.swift
//  set game
//
//  Created by KhamTran on 9/8/19.
//  Copyright © 2019 KhamTran. All rights reserved.
//

import Foundation
class cardList
{
     var list:[Card]
    init()
    {
        list = [Card]()
        getCombination()
        list = list.shuffled()
    }
   internal func getCombination()
     {
        for color in cardColor.allValues
        {
            for number in cardNumber.allValues
            {
                for symbol in cardSymbol.allValue
                {
                    for shading in cardShade.allValues
                    {
                        let card = Card(idNum: 0, cardColor:color,cardSymbol:symbol,cardNumber: number,cardShade: shading)
                        list.append(card)
                    }
                }
            }
        }
      }
    func differentColor(set: [Card])-> Bool{
        if set[0].cardColor != set[1].cardColor && set[0].cardColor != set[2].cardColor && set[1].cardColor != set[2].cardColor { return true}
        else {return false}
    }
    
    func differentShade(set:[Card]) -> Bool {
        if set[0].cardShade != set[1].cardShade && set[0].cardShade != set[2].cardShade && set[1].cardShade != set[2].cardShade { return true}
        else {return false}
    }
    
    func differentNumber(set: [Card])-> Bool {
        if set[0].cardNumber != set[1].cardNumber && set[0].cardNumber != set[2].cardNumber && set[1].cardNumber != set[2].cardNumber { return true}
            
        else {return false}
    }
    
    func differenSymbol(set: [Card]) -> Bool {
        if set[0].cardSymbol != set[1].cardSymbol && set[0].cardSymbol != set[2].cardSymbol && set[1].cardSymbol != set[2].cardSymbol{ return true}
            
        else {return false}
    }
    
    func isSet(set:[Card]) -> Bool {
        if !differentNumber(set: set)  {return true}
       else if !differentColor(set: set) && !differentShade(set: set) &&  !differentNumber(set: set ) && !differenSymbol(set: set)  {return true}
            
        
        else { return false}
    }
    
    func getCard(index:Int)->Card
    {
        return list[index]
    }
    func deleteCard(index:Int)
    {
        list.remove(at: index)
    }
}
