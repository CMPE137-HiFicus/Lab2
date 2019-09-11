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
    var viewList:[Card] = [Card]()
    var tempMatch:[Card] = [Card]()
    @IBAction func touchCards(_ sender:UIButton){
     if tempMatch.count < 3
     {
        let index = cardButtons.firstIndex(of: sender);        tempMatch.append(viewList[index!])
        
        tempMatch[tempMatch.count-1].idNum = index ?? 0
        }
     else{
        if cardlist.isSet(set: tempMatch)
        {
            for card in tempMatch
            {

                    let attributes = [NSAttributedString.Key:Any]()
                    let newAttribute = NSAttributedString(string: "",attributes: attributes    ); cardButtons[card.idNum].setAttributedTitle( newAttribute, for: UIControl.State.normal)
                print("\(tempMatch.count)")
                print("\(String(describing: cardButtons[card.idNum].attributedTitle(for: UIControl.State.normal)))")
                viewList.remove(at: card.idNum)
                tempMatch.removeAll()
                
            }
        }}
    }
    @IBAction func reset()
    {
        var cardlist = cardList()
        var viewList = [Card]()
        var tempMatch = [Card]()
        for button in cardButtons
        {
            let attributes = [NSAttributedString.Key:Any]()
            let newAttribute = NSAttributedString(string: "",attributes: attributes    ); button.setAttributedTitle( newAttribute, for: UIControl.State.normal)
        }
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
            viewList.append(card)
        }
        print("\(viewList.count)")
    }
    @IBAction func add3More()
    {
        var index = 0
        for button in cardButtons
        {
            if (button.attributedTitle(for: UIControl.State.normal) == nil || String(describing:button.attributedTitle(for: UIControl.State.normal)) == "Optional()") && index < 3
            {
                let card = cardlist.list[index]
                let temp:drawCard = drawCard()
                temp.renderCard(card: card, button: button)
                cardlist.deleteCard(index: index)
                index += 1
                viewList.append(card)
            }
        }
         print("\(viewList.count)")
    }
    func updateViewFormModel(){
     
        
       
        
    }
    
    
}

