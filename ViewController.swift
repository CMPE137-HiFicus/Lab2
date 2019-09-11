//
//  ViewController.swift
//  set game
//
//  Created by KhamTran on 9/8/19.
//  Copyright © 2019 KhamTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons:[UIButton]!
    var cardlist:cardList = cardList()

    
    @IBAction func touchCards(_ sender:UIButton){
        
        print("\(cardlist.list.count)")
        updateViewFormModel()
    }
    @IBAction func start()
    {
        for index in 0..<12
        {
            let Button = cardButtons[index]
            let card = cardlist.list[index]
            let temp:drawCard = drawCard()
            temp.renderCard(card: card, button: Button)
            cardlist.deleteCard(index: index)
        }
    }
    @IBAction func add3More()
    {
        var index = 0
        for button in cardButtons
        {
            if (button.attributedTitle(for: UIControl.State.normal) == nil) && index < 3
            {
                let card = cardlist.list[index]
                let temp:drawCard = drawCard()
                temp.renderCard(card: card, button: button)
                cardlist.deleteCard(index: index)
                index += 1
            }
        }
    }
    func updateViewFormModel(){
     
        
       
        
    }
    
    
}

