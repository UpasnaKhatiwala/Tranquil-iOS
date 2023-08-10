//
//  JournalEntryViewController.swift
//  Tranquil
//
//  Created by  on 2023-08-09.
//

import UIKit

class JournalEntryViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var journalLabel: UITextView!

    public var journalTitle: String = ""
    public var journal: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = journalTitle
        journalLabel.text = journal
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
