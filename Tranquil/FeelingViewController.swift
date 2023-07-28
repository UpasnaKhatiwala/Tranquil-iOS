//
//  FeelingViewController.swift
//  Tranquil
//
//  Created by Khushi Shukla on 2023-04-12.
//

import UIKit

class FeelingViewController: UIViewController {
    
    var buttonPressed: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func frustratedButtonPressed(_ sender: Any) {
        buttonPressed = "Frustrated"
        
        performSegue(withIdentifier: "FeelingFlow", sender: self)
    }
    
    @IBAction func positiveButtonPressed(_ sender: Any) {
        buttonPressed = "Positive"
        
        performSegue(withIdentifier: "FeelingFlow", sender: self)
    }
    
    
    
    @IBAction func stressedButtonPressed(_ sender: Any) {
        buttonPressed = "Stressed"
        
        performSegue(withIdentifier: "FeelingFlow", sender: self)
    }
    
    
    @IBAction func happyButtonPressed(_ sender: Any) {
        
        buttonPressed = "Happy"
        
        performSegue(withIdentifier: "FeelingFlow", sender: self)
    }
    
    
    
    @IBAction func sadButtonPressed(_ sender: Any) {
        buttonPressed = "Sad"
        
        performSegue(withIdentifier: "FeelingFlow", sender: self)
    }
    
    
    @IBAction func angryButtonPressed(_ sender: Any) {
        
        buttonPressed = "Angry"
        
        performSegue(withIdentifier: "FeelingFlow", sender: self)
    }
    
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "FeelingFlow" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.receivedData = buttonPressed
        }
    }

}
