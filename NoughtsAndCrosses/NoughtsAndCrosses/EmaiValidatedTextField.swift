//
//  EmaiValidatedTextField.swift
//  NoughtsAndCrosses
//
//  Created by Lauren Caverly on 6/1/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class EmaiValidatedTextField: UITextField, UITextFieldDelegate {
    
    var imageView: UIImageView!
    
    override func drawRect(rect: CGRect) {
        imageView = UIImageView(frame: CGRectMake(self.frame.width-30, 5, 22, 22))
        self.addSubview(imageView)
        
        self.delegate = self
    }
    

    func valid() -> Bool {
        
        print("Validating email: "+self.text!)
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self.text!)
        
    }
    
    func updateUI() {
        
        if self.valid() {
            imageView.image = UIImage(named: "input_valid")
        } else {
            imageView.image = UIImage(named: "input_invalid")
        }
        
    }
    
    func validate() -> Bool {
        self.updateUI()
        return valid()
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if string != "" {
            textField.text! += string
        } else {
            textField.text!.removeAtIndex(textField.text!.endIndex.predecessor())
        }
        self.updateUI()
        
        return false
    }
}
