//
//  AppDelegate.swift
//  SUB
//
//  Created by Sung Min Kim on 1/24/18.
//  Copyright © 2018 Sung Min Kim. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let sess = AVAudioSession.sharedInstance()
        try? sess.setCategory(AVAudioSessionCategorySoloAmbient)
        try? sess.setActive(true)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {
        NotificationCenter.default.post(name: NSNotification.Name.AVAudioSessionInterruption, object: nil)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
}


