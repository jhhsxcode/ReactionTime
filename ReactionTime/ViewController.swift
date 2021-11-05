//
//  ViewController.swift
//  ReactionTime
//
//  Created by Robert D. Brown
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    var gamePlayed = false
    var passedArrayOf: ArrayOf!
    var timeCounter = 0.0
    var timer = Timer()
    var buttonTimer = Timer()
    var tapCounter = 0
    var name = String()
    var level = Float()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(timeCounter)
        
        turnButtonsBlue()
        hideAllButtons()
        
        buttonCollection.first?.alpha = 1.0
        
        navigationItem.rightBarButtonItem?.title = ""
        
        levelLabel.text = "2"
        level = 2
    }
    
    
    func turnButtonsBlue()
    {
        for button in buttonCollection
        {
            button.backgroundColor = .blue
        }
    }
    
    func hideAllButtons()
    {
        for button in buttonCollection
        {
            button.alpha = 0.0
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        if gamePlayed {
            passedArrayOf.scores.append(timeCounter)
            passedArrayOf.names.append(name)
            passedArrayOf.levels.append(slider!.value)
            updateCloud()
        }
    }
    
    @IBAction func whenSliderMoved(_ sender: UISlider) {
        level = sender.value
        let formattedLevel = String(format: "%.2f", level)
        levelLabel.text = formattedLevel
    }
    
    func updateCloud() {
        //Add code to connect to firebase
    }
    
    @IBAction func buttonWasClicked(_ sender: UIButton) {
        
        if tapCounter == 0 {
            startTimer()
            
        }
        
        tapCounter += 1
        navigationItem.rightBarButtonItem?.title = "Count:\(tapCounter)"
        
        if tapCounter == 10 {
            stopTimer()
            buttonTimer.invalidate()
            gamePlayed = true
            for button in buttonCollection
            {
                button.backgroundColor = .red
            }
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (time) in
            self.timeCounter += 0.01
            self.timeLabel.text = String(format: "%.2f", self.timeCounter)
        })
        
        
        buttonTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(slider.value - 1), repeats: true) { (timer) in
                let randomNumber = Int.random(in: 0..<self.buttonCollection.count)
                self.hideAllButtons()
                self.buttonCollection[Int(randomNumber)].alpha = 1.0
        }
        
    }
    
    func stopTimer() {
        timer.invalidate()
        
        
        let score = String(format: "%.3f", timeCounter * Double(levelLabel.text!)!)
        scoreLabel.text = "\(score)"
    }
}

