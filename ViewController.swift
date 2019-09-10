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

    func updateViewFormModel(){
     
        
        for index in 0..<12
        {
            let Button = cardButtons[index]
            let card = cardlist.list[index]
            let temp:drawCard = drawCard()
            temp.renderCard(card: card, button: Button)
    
        }
        
    }
    
    
}

