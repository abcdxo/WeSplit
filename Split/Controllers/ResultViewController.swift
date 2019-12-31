//
//  ResultViewController.swift
//  Split
//
//  Created by Nick Nguyen on 12/22/19.
//  Copyright © 2019 Nick Nguyen. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var totalBill = ""
    var people  = 0
    var tip = 0
    var eachBill = ""
    var firstBill = ""
    var tipAmount = 0.0
    var color : UIColor?
    @IBOutlet weak var barLabel: UINavigationItem!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var eachLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
        resultLabel.textColor = color
        billLabel.textColor = color
        tipLabel.textColor = color
        totalLabel.textColor = color
        peopleLabel.textColor = color
        eachLabel.textColor = color
        
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(goBack))
       
        peopleLabel.text = "People: \(people)"
        tipLabel.text = "Tip: \(tip)% (\(tipAmount))"
        billLabel.text = "Bill: \(firstBill)"
        totalLabel.text = "Total bill: \(totalBill)"
        eachLabel.text = "Each: \(eachBill)"
    }
    
    @objc func goBack() {
        _ = self.navigationController?.popToRootViewController(animated:
                true)
              dismiss(animated: true, completion: nil)
        
    }
 
    @IBAction func sharedButtonTapped(_ sender: UIButton) {
        //Screenshot current screen
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.view.drawHierarchy(in: bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let activityViewController = UIActivityViewController(activityItems: [img ?? "No image"], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

