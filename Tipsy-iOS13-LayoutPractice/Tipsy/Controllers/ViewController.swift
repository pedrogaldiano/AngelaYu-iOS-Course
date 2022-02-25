//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var numberOfSplits: UILabel!
    @IBOutlet var zeroPercentButton: UIButton!
    @IBOutlet var twentyPercentButton: UIButton!
    @IBOutlet var tenPercentButton: UIButton!
    
    var decimal: Double = 0.0
    var numberOfPeople: Int = 2
    var totalPerPerson: Double = 0.0
    
    @IBAction func tipPercentageTapped(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        let tips = [zeroPercentButton, tenPercentButton, twentyPercentButton]
        
        for tip in tips {
            tip?.isSelected = false
        }
        sender.isSelected = true
        
        decimal = percentageToDouble(percentage: sender.currentTitle!)
    }
    
    @IBAction func numberOfSplitsChanged(_ sender: UIStepper) {
            numberOfSplits.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(numberOfSplits.text!)!
    }
    
    @IBAction func calculateTapped(_ sender: UIButton) {
        if let billValue = Double(billTextField.text!) {
                let totalToPay = billValue + billValue * decimal
            totalPerPerson = (totalToPay / Double(numberOfPeople))
            self.performSegue(withIdentifier: "goToResult", sender: "ViewController")
        }
        
    }
    
    func percentageToDouble(percentage: String) -> Double{
        if let value = Double(percentage.dropLast()) {
            return value / 100
        }
        return 0.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalPerPerson = totalPerPerson
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tipInDecimal = decimal
        }
    }
    
}

