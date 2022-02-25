//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var story0: UILabel!
    @IBOutlet var choice1: UIButton!
    @IBOutlet var choice2: UIButton!
    var storyBrain = StoryBrain()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyBrain.id = 0
        updateUI(id: storyBrain.id)
    
        print(storyBrain.stories[0])

    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        let buttonSelected = sender.accessibilityIdentifier!
        
//        guard let id = storyBrain.id else {
//            print("Id is nil\n")
//            return
//        }
        
        storyBrain.next(buttonSelected)
//        let nextStory = storyBrain.nextStory(goTo: nextPointer)
        updateUI(id: storyBrain.id)

    }
    
    func updateUI(id: Int) {
        story0.text = storyBrain.stories[id].title
        choice1.setTitle(storyBrain.stories[id].choice1, for: .normal)
        choice2.setTitle(storyBrain.stories[id].choice2, for: .normal)
    }
}

