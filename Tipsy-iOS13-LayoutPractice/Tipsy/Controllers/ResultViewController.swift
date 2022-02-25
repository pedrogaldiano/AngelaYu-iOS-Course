//
//  ResultViewController.swift
//  Tipsy
//
//  Created by PEDRO GALDIANO DE CASTRO on 01/02/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var totalPerPersonLabel: UILabel!
    @IBOutlet var scriptLabel: UILabel!
    
    var totalPerPerson: Double = 0.0
    var numberOfPeople: Int = 2
    var tipInDecimal: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPerPersonLabel.text = String(format: "%.2f", totalPerPerson)
        scriptLabel.text = "Split between \(numberOfPeople) people, with \(tipInDecimal * 100)% tip."
    }

    @IBAction func recalculateTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
