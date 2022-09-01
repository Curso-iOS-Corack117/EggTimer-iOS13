//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var totalTime: Int = 0
    var time: Int = 0
    var timer: Timer = Timer()
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func hardnessSelect(_ sender: UIButton) {
        let hardness: [String: Int] = ["Soft": 5 , "Medium": 7, "Hard": 12]
        let timeHardness: Int = hardness[sender.currentTitle!]!
        time = 60 * timeHardness
        totalTime = time
        timer.invalidate()
        progressBar.alpha = 1
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: timerUpdate)
    }
    
    func timerUpdate(timer: Timer) {
        if time > 0 {
            titleLabel.text = "Faltan \(time) segundos!"
            time -= 1
            progressBar.progress =  1.0 - (Float(time) / Float(totalTime))
        } else {
            titleLabel.text = "Tu huevo ya está listo 😄"
            timer.invalidate()
        }
    }
    
}
