//
//  LandingViewController.swift
//  NoughtsAndCrosses
//
//  Created by Lauren Caverly on 5/31/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Noughts and Crosses"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        print("Login button tapped")
        
        let lvc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        
        self.navigationController?.pushViewController(lvc, animated: true)
    }

    @IBAction func registerButtonTapped(sender: UIButton) {
        print("Register button tapped")
        
        let rvc = RegistrationViewController(nibName: "RegistrationViewController", bundle: nil)
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    

}
