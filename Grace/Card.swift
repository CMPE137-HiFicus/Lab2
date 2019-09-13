//
//  Card.swift
//  SetGame1
//
//  Created by Sang To on 9/10/19.
//  Copyright © 2019 Grace To. All rights reserved.
//

import Foundation
struct Card {
    let pattern: Pattern
    let quantity: Quantity
    let shade: Shade
    let fill: Fill
    var unhide: Bool
    var selected: Bool
    var isMatched: Bool
}

enum Shade {
    case red, green, black
    static let iList = [red, green, black]
}

enum Pattern {
    case triangle, circle, square
    static let iList = [triangle,circle,square]
}

enum Quantity {
    case one, two, three
    static let iList = [one,two,three]
}

enum Fill {
    case solid, striped, open
    static let iList = [solid,striped,open]
}
