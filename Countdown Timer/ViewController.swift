//
//  ViewController.swift
//  Countdown Timer
//
//  Created by Quan Wang on 6/18/20.
//  Copyright © 2020 Katie Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    var timer: Timer!
    
    @objc func UpdateTime() {
        let userCalendar = Calendar.current
        // Set Current Date
        let date = Date()
        let components = userCalendar.dateComponents([.hour, .minute, .month, .year, .day, .second], from: date)
        let currentDate = userCalendar.date(from: components)!
        
        var eventDateComponents = DateComponents()
        eventDateComponents.year = 2020
        eventDateComponents.month = 07
        eventDateComponents.day = 31
        eventDateComponents.hour = 00
        eventDateComponents.minute = 00
        eventDateComponents.second = 00
        eventDateComponents.timeZone = TimeZone(abbreviation: "EST")
        
        let eventDate = userCalendar.date(from: eventDateComponents)!
        let timeLeft = userCalendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: eventDate)
        
        timerLabel.text = "\(timeLeft.day!)d \(timeLeft.hour!)h \(timeLeft.minute!)m \(timeLeft.second!)s"
        
        endEvent(currentdate: currentDate, eventdate: eventDate)
    }
    
    func endEvent(currentdate: Date, eventdate: Date) {
        if currentdate >= eventdate {
            timerLabel.text = "Happy New Year!"
            // Stop Timer
            timer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true) // Repeat "func Update() " every second and update the label
        }

}

