//
//  BoardViewController.swift
//  NoughtsAndCrosses
//
//  Created by Alejandro Castillejo on 5/27/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var gameObject = OXGame()
    
    @IBOutlet weak var boardView: UIView!
    
    
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
        
        view.userInteractionEnabled = true
        
        
        //Rotation
        
        //create an instance of UIRotationGestureRecognizer
        let rotation: UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(BoardViewController.handleRotation(_:)))
        
        self.boardView.addGestureRecognizer(rotation)
        
        
        //Pinch
        
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(BoardViewController.handlePinch(_:)))
        
        self.boardView.addGestureRecognizer(pinch)
        
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
        
        if gameState == OXGameState.complete_someone_won || gameState == OXGameState.complete_no_one_won {
            
            print("\(winner) wins!")
            
            let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 1 * Int64(NSEC_PER_SEC))
            dispatch_after(time, dispatch_get_main_queue()) {
                
                self.resetGame()
            }
            
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
    
    func handleRotation(sender: UIRotationGestureRecognizer? = nil) {
        
        self.boardView.transform = CGAffineTransformMakeRotation(sender!.rotation)
        
        //Rotation ends
        print("rotation detected")
        if sender!.state == UIGestureRecognizerState.Ended {
            print("rotation \(sender!.rotation)")
            
            if sender!.rotation < CGFloat(M_PI)/2 {
                
                //snap action
                UIView.animateWithDuration(NSTimeInterval(3), animations: {})
                self.boardView.transform = CGAffineTransformMakeRotation(0)
                
            } else if sender!.rotation < CGFloat(M_PI) {
                
                //snap action
                UIView.animateWithDuration(NSTimeInterval(3), animations: {})
                self.boardView.transform = CGAffineTransformMakeRotation(0.5)
                
            } else if sender!.rotation < CGFloat(M_PI)*3/4 {
                
                //snap action
                UIView.animateWithDuration(NSTimeInterval(3), animations: {})
                self.boardView.transform = CGAffineTransformMakeRotation(1)
                
            } else {
                
                //snap action
                UIView.animateWithDuration(NSTimeInterval(3), animations: {})
                self.boardView.transform = CGAffineTransformMakeRotation(1.5)
                
            }
        }
    }
    
    func handlePinch(sender: UIPinchGestureRecognizer? = nil) {
        print("pinch detected")
        }

}
