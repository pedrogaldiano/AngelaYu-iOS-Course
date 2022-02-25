//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by PEDRO GALDIANO DE CASTRO on 28/01/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var bmiString: String?
    var adviceString: String?
    var backgroundColor: UIColor?
    
    @IBOutlet var bmiLabel: UILabel!
    @IBOutlet var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiString
        adviceLabel.text = adviceString
        view.backgroundColor = backgroundColor
    }
    
    @IBAction func recalculatedTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
