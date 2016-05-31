//
//  RegistrationViewController.swift
//  NoughtsAndCrosses
//
//  Created by Lauren Caverly on 5/31/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var registrationEmailField: UITextField!
    
    @IBOutlet weak var registrationPasswordField: UITextField!

    @IBOutlet weak var registrationErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Registration"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(sender: UIButton) {
        print("Register button tapped")
        
        let registrationEmail = registrationEmailField.text
        let registrationPassword = registrationPasswordField.text
        
        let (failure_message, user) = UserController.sharedInstance.registerUser(registrationEmail!, newPassword: registrationPassword!)
        
        if user != nil {
            print("User registered, view registration view")
        } else {
            if failure_message != nil {
                print(failure_message)
                registrationErrorLabel.text = failure_message
            }
        }
        
    }


}
