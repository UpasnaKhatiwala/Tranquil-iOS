//
//  ResultViewController.swift
//  Tranquil
//
//  Created by Khushi Shukla on 2023-04-12.
//

import UIKit

class ResultViewController: UIViewController {
    
    var receivedData: String?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var resultDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultDisplay.text = receivedData! + " Button was pressed!!!"
        
        if let image = UIImage(named: receivedData!) {
            imageView.image = image
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
