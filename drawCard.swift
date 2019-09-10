//
//  drawCard.swift
//  set game
//
//  Created by KhamTran on 9/10/19.
//  Copyright © 2019 KhamTran. All rights reserved.
//

import Foundation
import UIKit
class drawCard
{
    func getColor(of card:Card) -> UIColor{
        switch card.cardColor {
        case .red:
            return UIColor.red
        case .blue:
            return UIColor.blue
        case .green:
            return UIColor.green
        }}
    func getSymbol(of card:Card) -> String{
            switch card.cardSymbol {
            case .triangle:
                return "▲"
            case .square:
                return "■"
            case .circle:
                return "●"
            }
        }
    func getTitle(of card:Card, sysbol:String) ->String{
        switch card.cardNumber {
        case .one:
            return "\(sysbol)"
        case .two:
            return "\(sysbol)\(sysbol)"
        case .three:
            return "\(sysbol)\(sysbol)\(sysbol)"
        }
    }
    
    func getButton(of card:Card, withtitle title:String, withcolor color:UIColor)-> NSAttributedString{
        var attribute: [NSAttributedString.Key: Any ] = [:]
        
        switch card.cardShade {
        case .open:
            attribute[.strokeWidth] = 4
            attribute[.foregroundColor] = color
        case .solid:
            attribute[.strokeWidth] = 2
            attribute[.foregroundColor] = color
        case .striped:
            attribute[.strokeWidth] = -1
            attribute[.foregroundColor] = color.withAlphaComponent(0.25)
        }
        return NSAttributedString(string: title , attributes: attribute)
    }
    
    func renderCard (card:Card, button:UIButton)
    {
        let color = getColor(of: card)
        let symbol = getSymbol(of: card)
        let title = getTitle(of: card, sysbol: symbol)
        let attribute = getButton(of: card, withtitle: title, withcolor: color)
        
        button.setAttributedTitle(attribute, for: UIControl.State.normal)
    }
    /*public static func renderCard(cardToRender card: Card, onButton: UIButton, selectButton: Bool, isSet: Bool) {
        
        let buttonColor = getColor(ofCard: card)
        let cardSymbol = getSymbol(ofCard: card)
        let buttonTitle = getButtonTitle(ofCard: card, usingSymbol: cardSymbol)
        let attributedTitle = getButtonAttributedTitle(ofCard: card, withTitle: buttonTitle, withColor: buttonColor)
        
        onButton.setAttributedTitle(attributedTitle, for: UIControlState.normal)
        
        if selectButton {
            if isSet {
                onButton.select(borderColor: #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1))
            } else {
                onButton.select()
            }
        } else {
            onButton.deselect()
     }}*/	
}

