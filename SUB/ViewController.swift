//
//  ViewController.swift
//  SUB
//
//  Created by Sung Min Kim on 1/24/18.
//  Copyright © 2018 Sung Min Kim. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prebuffAudio()
        
        NotificationCenter.default.addObserver(self,
                                               selector:#selector(handleSecondaryAudio(notification:)),
                                               name: NSNotification.Name.AVAudioSessionInterruption,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func prebuffAudio(){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sample", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()
            
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
    }
    
    @objc func handleSecondaryAudio(notification: Notification) {
        // Determine hint type
        guard let userInfo = notification.userInfo,
            let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
            let type = AVAudioSessionInterruptionType(rawValue: typeValue) else {
                return
        }
        
        switch type {
        case .began:
            print("began")
            // Other app audio started playing - mute secondary audio
        default:
            print("began")
            // Other app audio stopped playing - restart secondary audio

        }
    }
    
    @IBAction func startSUB(_ sender: Any) {
        audioPlayer.play()
    }
    
    @IBAction func stopSUB(_ sender: Any) {
        audioPlayer.stop()
    }
}

