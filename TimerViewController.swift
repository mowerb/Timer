//
//  TimerViewController.swift
//  Timer
//
//  Created by Zebra on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func pauseButtonTapped(sender: AnyObject) {
    }
    @IBAction func startButtonTapped(sender: AnyObject) {
        toggleTimer()
    }
    
    func toggleTimer() {
        if timer.isOn {
            timer.stopTimer()
            switchToPickerView()
        } else {
            switchToPickerView()
            
            let hours = datePicker.countDownDuration / 3600
            let minutes = (datePicker.countDownDuration - (hours * 3600)) / 60
            let seconds = (datePicker.countDownDuration - (hours * 3600) - (minutes * 60))
                
            
            timer.setTimer(seconds, totalSeconds: seconds)
            updateTimerBasedViews()
            timer.startTimer()
        }
    }
    
    func updateTimerLabel() {
        
        timerLabel.text = timer.string
    
    }
    
    func updateProgressView() {
        
        let secondsElapsed = timer.totalSeconds - timer.seconds
        
        let progress = Float(secondsElapsed) / Float(timer.totalSeconds)
        
        progressView.setProgress(progress, animated: true)
    }
    
    func updateTimerBasedViews() {
        updateTimerLabel()
        updateProgressView()
    }
    
    func timerComplete() {
        switchToPickerView()
    }
    
    func switchToTimerView() {
        timerLabel.hidden = false
        progressView.setProgress(0.0, animated: false)
        progressView.hidden = false
        datePicker.hidden = true
        startButton.setTitle("Cancel", forState: .Normal)
        
    }
    
    func switchToPickerView() {
        datePicker.hidden = false
        timerLabel.hidden = true
        progressView.hidden = true
        startButton.setTitle("Start", forState: .Normal)
    }
    
}










































