//
//  ViewController.swift
//  Timer1
//
//  Created by Роберт Райсих on 17/03/2019.
//  Copyright © 2019 Роберт Райсих. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var fractions = 0
    var seconds = 0
    var minutes = 0
    var hours = 0

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    @IBAction func startButtonDidPressed(_ sender: Any) {
        stopButton.isHidden = false
        startButton.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @IBAction func stopButtonDidPressed(_ sender: Any) {
        timer.invalidate()
        stopButton.isHidden = true
        startButton.isHidden = false
    }
    @IBAction func resedButtonDidPressed(_ sender: Any) {
        fractions = 0
        seconds = 0
        minutes = 0
        timerLabel.text = "00:00:00:00"
    }
    
    @objc func updateTimer(){
        
        fractions += 1
        if fractions == 100{
            seconds += 1
            fractions = 0
        }
        if seconds == 60{
            minutes += 1
            seconds = 0
        }
        if minutes == 60{
            hours += 1
            minutes = 0
        }
        
        timerLabel.text = String(format: "%02d:%02d:%02d:%02d", hours, minutes, seconds, fractions)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.isHidden = true
        startButton.isHidden = false
        timerLabel.text = "00:00:00:00"

        // Do any additional setup after loading the view, typically from a nib.
    }


}

