//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var appTitle: UILabel!
    let hardnessTime: [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var player: AVAudioPlayer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0
        appTitle.text = sender.currentTitle
        
        let seconds = Float(hardnessTime[sender.currentTitle!]! * 1)
        let onePercent = 1 / seconds
        var progress:Float = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
        { timer in
            print(progress)
            progress += onePercent
            self.progressBar.progress = progress
            
            
            if progress >= 1 {
                timer.invalidate()
                self.appTitle.text = "Done!"
                self.playSound()
            }

        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
