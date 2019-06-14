//
//  NotificationHandler.swift
//  Shopping List
//
//  Created by Sean Acres on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications

func addLocalNotification(title: String, body: String) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    
    var dateComponents = DateComponents()
    dateComponents.calendar = Calendar.current
    dateComponents.second = 10
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
    
    let uuidString = UUID().uuidString
    let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
    
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.add(request) { (error) in
        if error != nil {
            print(error!)
        }
    }
}

