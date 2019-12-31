//
//  SettingsViewController.swift
//  Split
//
//  Created by Nick Nguyen on 12/23/19.
//  Copyright © 2019 Nick Nguyen. All rights reserved.
//

import UIKit
import MediaPlayer
//import AVFoundation

class SettingsViewController: UITableViewController { 
//    var audioPlayer : AVAudioPlayer!
    
     let userDefaults = UserDefaults.standard
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var roundSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.alwaysBounceVertical = false
//        soundSwitch.setOn(userDefaults.bool(forKey: "SoundValue"), animated: true)
//       roundSwitch.setOn(userDefaults.bool(forKey: "RoundValue"), animated: true)
        soundSwitch.isOn = userDefaults.bool(forKey: "SoundValue")
        roundSwitch.isOn = userDefaults.bool(forKey: "RoundValue")
    }
    
    @IBAction func soundSwitched(_ sender: UISwitch) {
        userDefaults.set(sender.isOn, forKey: "SoundValue")
      
    }
    
    @IBAction func roundSwitched(_ sender: UISwitch) {
        userDefaults.set(sender.isOn, forKey: "RoundValue")
    }
    
    @IBAction func actionTapped(_ sender: UIButton) {
//           self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
