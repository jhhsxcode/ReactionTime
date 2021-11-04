//
//  InitialViewController.swift
//  ReactionTime
//
//  Created by Robert D. Brown
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        textField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! TableViewController
        if let name = textField.text {
            nvc.name = name
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
    }

}
