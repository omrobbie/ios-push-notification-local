//
//  ViewController.swift
//  ios-push-notification
//
//  Created by omrobbie on 11/07/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotification()
    }

    private func setupNotification() {
        UNUserNotificationCenter.current().delegate = self

        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                if granted {
                    print("Mendapatkan izin dari pengguna untuk local notifications")
                } else {
                    print("Tidak mendapatkan izin dari pengguna untuk local notifications")
                }
        }
    }

    @IBAction func btnNotifTapped(_ sender: Any) {
    }
}

extension ViewController: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("UserInfo yang terkait dengan notifikasi == \(response.notification.request.content.userInfo)")
        completionHandler()
    }
}
