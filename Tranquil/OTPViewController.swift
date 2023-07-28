//
//  OTPViewController.swift
//  Tranquil
//
//  Created by Khushi Shukla on 2023-04-11.
//

import UIKit

class OTPViewController: UIViewController {
    
    
    @IBOutlet weak var o1: UITextField!
    
    @IBOutlet weak var o2: UITextField!
    
    @IBOutlet weak var o3: UITextField!
    
    @IBOutlet weak var o4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        o1.becomeFirstResponder()
    }
    
    
    @IBAction func onVerifyButtonPressed(_ sender: Any) {
        if (
            o1.text! == "1" &&
            o2.text! == "1" &&
            o3.text! == "1" &&
            o4.text! == "1"
        ) {
            performSegue(withIdentifier: "OTPVerifiedFlow", sender: self)
        } else {
            let alert = UIAlertController(title: "Error", message: "Incorrect OTP", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            o1.text = ""
            o2.text = ""
            o3.text = ""
            o4.text = ""
        }
    }
    
    
    @IBAction func onResendButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Success", message: "OTP Sent", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
        o1.text = ""
        o2.text = ""
        o3.text = ""
        o4.text = ""
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
