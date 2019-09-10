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
                        let card = Card(cardColor:color,cardSymbol:symbol,cardNumber: number,cardShade: shading)
                        list.append(card)
                    }
                }
            }
        }
      }
    
    
    func getCard(index:Int)->Card
    {
        return list[index]
    }
}
