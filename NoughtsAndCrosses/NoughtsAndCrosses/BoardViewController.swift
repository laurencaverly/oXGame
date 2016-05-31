//
//  BoardViewController.swift
//  NoughtsAndCrosses
//
//  Created by Alejandro Castillejo on 5/27/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {
    
    var gameObject = OXGame()
    
    @IBOutlet var boardView: UIView!
    
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapButton(sender: AnyObject) {
        
        let tag = sender.tag
        print("Button \(tag) tapped!")
        
        let playerType = gameObject.playMove(tag)
        
        sender.setTitle(String(playerType), forState: UIControlState.Normal)
        
        let gameState = gameObject.state()
        var winner:String
        
        if String(playerType) == "X" {
            winner = "Player"
        } else {
            winner = "Computer"
        }
        
        if gameState == OXGameState.complete_someone_won {
            
            print("\(winner) wins!")
            
            self.resetGame()
        } else if gameState == OXGameState.complete_no_one_won {
            
            print("\(winner) wins!")
            
            self.resetGame()
        }
    }
    
    
    @IBAction func newGame(sender: AnyObject) {
        
        print("New Game button tapped!")
        
        self.resetGame()
        
    }
    
    func resetGame() {
        
        gameObject.reset()
        
        button0.setTitle("", forState: UIControlState.Normal)
        button1.setTitle("", forState: UIControlState.Normal)
        button2.setTitle("", forState: UIControlState.Normal)
        button3.setTitle("", forState: UIControlState.Normal)
        button4.setTitle("", forState: UIControlState.Normal)
        button5.setTitle("", forState: UIControlState.Normal)
        button6.setTitle("", forState: UIControlState.Normal)
        button7.setTitle("", forState: UIControlState.Normal)
        button8.setTitle("", forState: UIControlState.Normal)
        
    }
    
    

}
