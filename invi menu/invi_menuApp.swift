//
//  invi_menuApp.swift
//  invi menu
//
//  Created by Anubhav Gain on 29/02/24.
//

import SwiftUI
import UserNotifications

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}

@main
struct invi_menuApp: App {
    @State var currentNumber: String = "1"
    private let notificationDelegate = NotificationDelegate()
    
    var body: some Scene {
        WindowGroup {
            EmptyView()
                .onAppear {
                    UNUserNotificationCenter.current().delegate = notificationDelegate
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                        if granted {
                            print("Notification authorization granted")
                        } else if let error = error {
                            print("Notification authorization error: \(error.localizedDescription)")
                        }
                    }
                }
        }

        MenuBarExtra(currentNumber, systemImage: "medal") {
            Button("One") {
                currentNumber = "1"
                showNotification(number: "1")
            }
            Button("Two") {
                currentNumber = "2"
            }
            Button("Three") {
                currentNumber = "3"
            }
        }
    }
    
    private func showNotification(number: String) {
        let content = UNMutableNotificationContent()
        content.title = "Number Selected"
        content.body = "You selected number \(number)"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
