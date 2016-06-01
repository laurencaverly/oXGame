//
//  RegistrationViewController.swift
//  NoughtsAndCrosses
//
//  Created by Lauren Caverly on 5/31/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var registrationEmailField: EmaiValidatedTextField!
    
    @IBOutlet weak var registrationPasswordField: UITextField!

    @IBOutlet weak var registrationErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Registration"

        // Do any additional setup after loading the view.
        registrationEmailField.delegate = self
        registrationPasswordField.delegate = self
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
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        if user != nil {
            if registrationEmailField.validate() {
                print("User registered, view registration view")
            } else {
                return
            }
        } else {
            if failure_message != nil {
                print(failure_message)
                registrationErrorLabel.text = failure_message
            }
        }
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if textField == registrationEmailField {
            print("Email textField text is \(registrationEmailField.text!)")
            print("String is \(string)")
        } else {
            print ("Password textField text is \(registrationPasswordField.text!)")
            print("String is \(string)")
        }
        
        
        return true
    }


}
