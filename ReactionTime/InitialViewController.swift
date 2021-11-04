//
//  InitialViewController.swift
//  ReactionTime
//
//  Created by Robert D. Brown on 10/25/17.
//  Copyright © 2017 Robert D. Brown. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
