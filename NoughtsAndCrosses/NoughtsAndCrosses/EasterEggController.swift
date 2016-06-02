//
//  EasterEggController.swift
//  NoughtsAndCrosses
//
//  Created by Lauren Caverly on 6/1/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import Foundation
import UIKit

class EasterEggController: NSObject, UIGestureRecognizerDelegate {
    
    
    //MARK: Class Singleton
    class var sharedInstance: EasterEggController {
        struct Static {
            static var instance:EasterEggController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token)    {
            Static.instance = EasterEggController()
        }
        return Static.instance!
    }
    
    
    func initiate(view:UIView) {
        
        var orderArray = [Int] (count: 5, repeatedValue: 0)
        
        
        //Long Press
        let longPress: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: view, action: #selector(EasterEggController.handleLongPress(_:)))
        
        view.addGestureRecognizer(longPress)
        
        if handleLongPress() {
            orderArray[0] = 0
        }
        
        
        //Right Swipe
        let rightSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: view, action: #selector(EasterEggController.handleRightSwipe(_:)))
        
        let swipeRightDirection = UISwipeGestureRecognizerDirection.Right
        
        rightSwipe.direction = swipeRightDirection
        rightSwipe.numberOfTouchesRequired = 1
        
        view.addGestureRecognizer(rightSwipe)
        
        if handleRightSwipe() {
            orderArray[1] = 1
        }
        
        
        
        //Two Finger Down Swipe
        let downSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: view, action: #selector(EasterEggController.handleRightSwipe(_:)))
        
        let swipeDownDirection = UISwipeGestureRecognizerDirection.Down
        downSwipe.direction = swipeDownDirection
        downSwipe.numberOfTouchesRequired = 2
        
        view.addGestureRecognizer(downSwipe)
        
        if handleDownSwipe() {
            orderArray[2] = 2
        }
        
        
        //Rotation
        let rotation: UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: view, action: #selector(EasterEggController.handleRotation(_:)))
        
        view.addGestureRecognizer(rotation)
        rotation.delegate = self
    
        if handleRotation(rotation) == "ClockWiseRotation" {
            orderArray[3] = 3
        } else if handleRotation(rotation) == "CounterClockWise"{
            orderArray[4] = 4
        }
        
        //check for easter egg condition
        if orderArray[0] < orderArray[1] && orderArray[1] < orderArray[2] && orderArray[2] < orderArray[3] && orderArray[3] < orderArray[4] {
            //easter egg
            let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.navigateToEasterEggScreen()
        }
        
    }
    
    //Allow to recognize multiple gestures of the same type
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        
        return true
    }
    
    func handleLongPress(sender: UILongPressGestureRecognizer? = nil)->Bool {
        print("long press detected")
        return true
    }
    
    func handleRightSwipe(sender: UISwipeGestureRecognizer? = nil) -> Bool {
        print("right swipe detected")
        return true
    }
    
    func handleDownSwipe(sender: UISwipeGestureRecognizer? = nil)->Bool {
        print("down swipe detected")
        return true
    }
    
    func handleRotation(sender: UIRotationGestureRecognizer) -> String {
        
        sender.view?.transform = CGAffineTransformMakeRotation(sender.rotation)
        
        //Rotation Ends
        print("rotation detected")
        
        if sender.state == UIGestureRecognizerState.Ended {
            print("rotation ended: \(sender.rotation) degrees")
            
            if sender.rotation > 0 {
                print("CounterClockWise")
                return "CounterClockWise"
            } else {
                print("ClockWiseRotation")
                return "ClockWiseRotation"
            }
        }
        
        return ""
    }
    
    
}