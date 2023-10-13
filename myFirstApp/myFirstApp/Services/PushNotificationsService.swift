//
//  PushNotificationsService.swift
//  myFirstApp
//
//  Created by ATLAS Laptop 4 Guest on 10/9/23.
//

import Foundation
import NotificationCenter

class PushNotificationService {
    var isPermissionGranted = false
    func requestPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {
                success, error in
                    if success {
                        self.isPermissionGranted = true
                    }
                    else if let error = error {
                        print(error.localizedDescription)
                    }
                }
    }
    
    func scheduleNotification(title: String, subtitle: String) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //let trigger - UNCalendarNotificationTrigger(dateMatching: .init(year: 2023, month: 12, day: 10, hour: 0, minute: 0), repeats: true)
        
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
        
        
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if let error = error {
                print("Error in push notification: \(error)")
            }
        }
    }
    
    func clearNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
