//
//  ViewController.swift
//  SetGame1
//
//  Created by Sang To on 9/10/19.
//  Copyright © 2019 Grace To. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = SetGame()
    var shownBtns = 12
    var selectedList = Array<Any>()
    typealias tup1 = (buttonIndex: Int, cardAttribute: Card)
    typealias tup2 = (buttonIndex: Int, cardAttribute: Card)
    typealias tup3 = (buttonIndex: Int, cardAttribute: Card)
    var cardMap:[Int?: Card] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        updateViewFromModel()
    }

    @IBOutlet var cardButtons:[UIButton]!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var deal3cards: UIButton!
    
    @IBAction func startGame(_ sender: Any) {
        start.isEnabled = false
        for index in 0..<shownBtns
        {
            let button = cardButtons[index]
            let card = game.deck[index]
            let temp:IconSelection = IconSelection()
            temp.mixmatch(of: card, onButton: button)
            cardMap[index] = card
        }
        
    }
    
    @IBAction func newgame(_ sender: Any) {
        game = SetGame()
        start.isEnabled = true
        shownBtns = 12
            for button in cardButtons
            {
                let attributes = [NSAttributedString.Key:Any]()
                let newAttribute = NSAttributedString(string: "",attributes: attributes    ); button.setAttributedTitle( newAttribute, for: UIControl.State.normal)
                
        }
    }
    
    
    @IBAction func deal(_ sender: Any) {
        var index = 0
            for button in cardButtons {
                if (button.attributedTitle(for: UIControl.State.normal) == nil || String(describing:button.attributedTitle(for: UIControl.State.normal)) == "Optional()") && index < 3
                {
                if shownBtns < cardButtons.count {
                    let button = cardButtons[shownBtns]
                    let card = game.deck[shownBtns]
                    let temp:IconSelection = IconSelection()
                    temp.mixmatch(of: card, onButton: button)
                    shownBtns += 1
                    index += 1
                    let num = cardButtons.firstIndex(of: button)
                    cardMap[num] = card
                    }
                    
                }
        }
        }
    
    @IBAction func touchCards(_ sender:UIButton){
    
        let cardNumber = cardButtons.firstIndex(of: sender)
            for index in 0..<3 {
                let card = cardMap[cardNumber]
                print(card?.pattern)
            }
//        print(game.isSet(card1: selectedList[0] , card2: selectedList[1] , card3: selectedList[2]))
    }

}



extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
