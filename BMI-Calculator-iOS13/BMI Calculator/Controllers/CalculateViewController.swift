//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var heightValue: UILabel!
    @IBOutlet var weightSlider: UISlider!
    @IBOutlet var weightValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightChanged(_ sender: UISlider) {
        heightValue.text = String(format: "%.2f", sender.value) + "m"
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        weightValue.text = String(format: "%.0f", sender.value) + "Kg"
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        print(weightSlider.value)
        print(heightSlider.value)
       
        calculatorBrain.calculateBMI(weightSlider.value, heightSlider.value)
        
        self.performSegue(withIdentifier: "goToResult", sender: "CalculateViewController")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinantionVC = segue.destination as! ResultViewController
            destinantionVC.bmiString = calculatorBrain.getBMIString()
            destinantionVC.adviceString = calculatorBrain.getAdvice()
            destinantionVC.backgroundColor = calculatorBrain.getColor()
        }
    }
    
}

