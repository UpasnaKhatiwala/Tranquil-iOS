//
//  ViewController.swift
//  Tranquil
//
//  Created by Khushi Shukla on 2023-04-11.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOUTLETS
    @IBOutlet weak var emailAddress: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    // MARK: - Variables
    var model = UserInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBACTIONS
    @IBAction func onSignupButtonPressed(_ sender: Any) {
        // get the email address and password
        // check if email address is saved
        // if not save it
        // go to next screen
        model.saveData(emailAddress: emailAddress.text!, password: password.text!)
        
        performSegue(withIdentifier: "SignupFlow", sender: self)
    }
    
}

