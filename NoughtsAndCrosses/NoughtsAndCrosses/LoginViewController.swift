//
//  LoginViewController.swift
//  NoughtsAndCrosses
//
//  Created by Lauren Caverly on 5/31/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginEmailField: UITextField!
    
    @IBOutlet weak var loginPasswordField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        
        print("Login & Play button tapped")
        
        let loginEmail = loginEmailField.text
        let loginPassword = loginPasswordField.text
        
        let(failure_message, user) = UserController.sharedInstance.loginUser(loginEmail!, suppliedPassword: loginPassword!)
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        if user != nil {
            print("User logged in, view login view")
            appDelegate.navigateToLoggedInNavigationController()
        } else {
            if failure_message != nil {
                print(failure_message)
                errorLabel.text = failure_message
            }
        }
    }

    

}
