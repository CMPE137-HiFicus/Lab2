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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateViewFromModel()
    }

    @IBOutlet var cardButtons:[UIButton]!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var deal3cards: UIButton!
    
    @IBAction func startGame(_ sender: Any) {
        start.isEnabled = false
    }
    
    @IBAction func deal(_ sender: Any) {
        if shownBtns < cardButtons.count {
            shownBtns += 3
        }
    }
    var shownBtns = 12
    var selectedList = Array<Any>()
    
    
    @IBAction func touchCards(_ sender:UIButton){
        
        print("\(game.deck.count)")
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            _ = game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen Card was not in cardButton")
        }
        
    }
    
    func updateViewFromModel(){
        for index in 0..<cardButtons.count
        {
            let button = cardButtons[index]
            var card = game.deck[index]
            let temp:IconSelection = IconSelection()
            temp.mixmatch(of: card, onButton: button)
            game.deck.remove(at: index)
            if index >= shownBtns {
                button.isHidden = true
                card.unhide = true
            } else {
                button.isHidden = false
                card.unhide = false
            }
            
            if card.selected {
                button.layer.borderWidth = 3.0
                button.layer.borderColor = UIColor.blue.cgColor
                button.layer.cornerRadius = 8.0
                if selectedList.count < 3 {
                    button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                    selectedList.append(card)
                } else if selectedList.count == 3 {
                    if card.isMatched {
                        let attributes = [NSAttributedString.Key: Any]()
                        let na = NSAttributedString(string: "", attributes: attributes)
                        button.setAttributedTitle(na, for: UIControl.State.normal)
                    }
                } else {
                    
                }
                
            } else {
                button.showsTouchWhenHighlighted = false
            }
        }
        
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
