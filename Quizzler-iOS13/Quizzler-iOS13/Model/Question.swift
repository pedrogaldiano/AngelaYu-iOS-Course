//
//  QuizModel.swift
//  Quizzler-iOS13
//
//  Created by PEDRO GALDIANO DE CASTRO on 13/01/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answerOptions: [String]
    let correctAnswer: String
    
    init(q question: String, a answerOptions: [String], correctAnswer: String) {
        self.question = question
        self.answerOptions = answerOptions
        self.correctAnswer = correctAnswer
    }
}

