//
//  IconSelection.swift
//  SetGame1
//
//  Created by Sang To on 9/10/19.
//  Copyright © 2019 Grace To. All rights reserved.
//

import Foundation
import UIKit
class IconSelection {
    func getPattern(of card:Card) -> String{
        switch card.pattern {
        case .triangle:
            return "▲"
        case .square:
            return "■"
        case .circle:
            return "●"
        }
    }
    
    func getQuantity(of card:Card, pattern:String) ->String{
        switch card.quantity {
        case .one:
            return "\(pattern)"
        case .two:
            return "\(pattern)\(pattern)"
        case .three:
            return "\(pattern)\(pattern)\(pattern)"
        }
    }
    
    func getColor(of card:Card) -> UIColor{
        switch card.shade {
        case .red:
            return UIColor(red:0.95, green:0.03, blue:0.31, alpha:1.0)
        case .black:
            return UIColor.black
        case .green:
            return UIColor(red:0.11, green:0.63, blue:0.16, alpha:1.0)
        }}
    
    func getFillButton(of card:Card, withtitle title:String, withcolor color:UIColor)-> NSAttributedString{
        var attribute: [NSAttributedString.Key: Any ] = [:]
        
        switch card.fill {
        case .open:
            attribute[.strokeWidth] = 5
            attribute[.foregroundColor] = color
        case .solid:
            attribute[.strokeWidth] = -2
            attribute[.foregroundColor] = color
        case .striped:
            attribute[.strokeWidth] = -10
            attribute[.foregroundColor] = color.withAlphaComponent(0.25)
        }
        return NSAttributedString(string: title , attributes: attribute)
    }
    
    func mixmatch(of card:Card, onButton button:UIButton) {
        let color = getColor(of: card)
        let symbol = getPattern(of: card)
        let title = getQuantity(of: card, pattern: symbol)
        let attribute = getFillButton(of: card, withtitle: title, withcolor: color)
        button.setAttributedTitle(attribute, for: UIControl.State.normal)
    }
}

