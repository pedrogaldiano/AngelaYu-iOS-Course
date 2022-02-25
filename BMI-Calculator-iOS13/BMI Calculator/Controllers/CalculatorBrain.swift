//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by PEDRO GALDIANO DE CASTRO on 28/01/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(_ weight: Float, _ height: Float) {
        let bmiValue = weight / pow(height, 2)
        bmiAnalysis(bmiValue)
    }
    
    
    mutating func bmiAnalysis(_ bmiValue: Float) {
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice:  "Eat more calories", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice:  "You are in good shape, congrats!", color: .systemPink)
        } else {
            bmi = BMI(value: bmiValue, advice:  "Eat less calories", color: .red)
        }
    }
    
    func getBMIString() -> String {
        let bmiString = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiString
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Sorry, no Advice here."
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .cyan
    }
}
