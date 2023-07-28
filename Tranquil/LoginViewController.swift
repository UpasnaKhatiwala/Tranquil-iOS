//
//  LoginViewController.swift
//  Tranquil
//
//  Created by Khushi Shukla on 2023-04-11.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOUTLETS
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    // MARK: - Variables
    var model = UserInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBACTIONS
    @IBAction func onLoginButtonPressed(_ sender: Any) {
        let savedPassword = model.getData(emailAddress: email.text!)
        
        if (savedPassword == password.text!) {
            performSegue(withIdentifier: "LoginFlow", sender: self)
        } else  {
            let alert = UIAlertController(title: "Error", message: "Incorrect password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
