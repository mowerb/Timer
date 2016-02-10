//
//  Alarm.swift
//  Timer
//
//  Created by Zebra on 2/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class Alarm: NSObject {
    
    static let categoryAlarm = "Alarm Category"
    static let notificationComplete = "Notification Complete"
    
    private(set) var alarmDate: NSDate?
    private var localNotification: UILocalNotification?
    var isArmed: Bool {
        get {
            if alarmDate != nil {
                return true
            } else {
                return false
            }
        }
    }
    
    
    func arm(fireDate: NSDate) {
        alarmDate = fireDate
        let alarmNotification = UILocalNotification()
        alarmNotification.fireDate = alarmDate
        alarmNotification.timeZone = NSTimeZone.localTimeZone()
        alarmNotification.soundName = "sms-received3.caf"
        alarmNotification.alertBody = "RING, RING!"
        alarmNotification.category = Alarm.categoryAlarm
        
        UIApplication.sharedApplication().scheduleLocalNotification(alarmNotification)
    }

    func cancel() {
        
        if isArmed {
            alarmDate = nil
            if let localNotification = localNotification {
                UIApplication.sharedApplication().cancelLocalNotification(localNotification)
            }
        }
    }
    static func alarmComplete() {
        // post alarm complete notification
        NSNotificationCenter.defaultCenter().postNotificationName(Alarm.notificationComplete, object: nil)
    }
}
