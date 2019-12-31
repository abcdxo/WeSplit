//
//  SettingsViewController.swift
//  Split
//
//  Created by Nick Nguyen on 12/23/19.
//  Copyright © 2019 Nick Nguyen. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

class SettingsViewController: UITableViewController { 
    var audioPlayer : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.alwaysBounceVertical = false
        
    }
    
    @IBAction func soundSwitched(_ sender: UISwitch) {
        
      
    }
    
    @IBAction func roundSwitched(_ sender: UISwitch) {
        
    }
    
    @IBAction func actionTapped(_ sender: UIButton) {
           self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
