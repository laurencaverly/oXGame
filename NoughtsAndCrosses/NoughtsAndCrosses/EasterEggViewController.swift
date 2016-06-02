//
//  EasterEggViewController.swift
//  NoughtsAndCrosses
//
//  Created by Lauren Caverly on 6/1/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class EasterEggViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func returnButtonTapped(sender: UIButton) {
        print("easter egg return button tapped")
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.navigateToBoardViewController()
        
    }
    

}
