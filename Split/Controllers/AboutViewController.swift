//
//  AboutViewController.swift
//  Split
//
//  Created by Nick Nguyen on 12/23/19.
//  Copyright © 2019 Nick Nguyen. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
  
    @IBAction func dismissTapped(_ sender: UIButton) {
//     self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToTwitter(_ sender: UIButton) {
        let twitterUrl = URL(string: "twitter://user?screen_name=tonic4000")!
        let twitterUrlWeb = URL(string: "https://www.twitter.com/tonic4000")!
        if UIApplication.shared.canOpenURL(twitterUrl) {
           UIApplication.shared.open(twitterUrl, options: [:],completionHandler: nil)
        } else {
           UIApplication.shared.open(twitterUrlWeb, options: [:], completionHandler: nil)
        }
    }
    
}
