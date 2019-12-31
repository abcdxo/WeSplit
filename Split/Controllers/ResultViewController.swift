//
//  ResultViewController.swift
//  Split
//
//  Created by Nick Nguyen on 12/22/19.
//  Copyright © 2019 Nick Nguyen. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var roundOn: Bool = true
    let userDefaults = UserDefaults.standard
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
        roundOn = userDefaults.bool(forKey: "RoundValue")
        view.backgroundColor = color
        resultLabel.textColor = color
        billLabel.textColor = color
        tipLabel.textColor = color
        totalLabel.textColor = color
        peopleLabel.textColor = color
        eachLabel.textColor = color
        if roundOn == true {
            peopleLabel.text = "People: \(people)"
            tipLabel.text = "Tip: \(tip)% (\(tipAmount.rounded()))"
            billLabel.text = "Bill: \(Double(firstBill)!.rounded())"
            totalLabel.text = "Total bill: \(Double(totalBill)!.rounded() )"
            eachLabel.text = "Each: \(Double(eachBill)!.rounded())"
        } else if roundOn == false {
            peopleLabel.text = "People: \(people)"
            tipLabel.text = "Tip: \(tip)% (\(tipAmount))"
            billLabel.text = "Bill: \(firstBill)"
            totalLabel.text = "Total bill: \(totalBill)"
            eachLabel.text = "Each: \(eachBill)"
        }
    }
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
         roundOn = userDefaults.bool(forKey: "RoundValue")
     if roundOn == true {
                peopleLabel.text = "People: \(people)"
                tipLabel.text = "Tip: \(tip)% (\(tipAmount.rounded()))"
                billLabel.text = "Bill: \(Double(firstBill)!.rounded())"
                totalLabel.text = "Total bill: \(Double(totalBill)!.rounded() )"
                eachLabel.text = "Each: \(Double(eachBill)!.rounded())"
            } else if roundOn == false {
                peopleLabel.text = "People: \(people)"
                tipLabel.text = "Tip: \(tip)% (\(tipAmount))"
                billLabel.text = "Bill: \(firstBill)"
                totalLabel.text = "Total bill: \(totalBill)"
                eachLabel.text = "Each: \(eachBill)"
            }
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ViewController
        destVC.number.removeAll()
        destVC.numberLabel.text = ""
    }
    //        navigationItem.setHidesBackButton(true, animated: false)
    //        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(goBack))

    //        if roundOn == true {
    //        peopleLabel.text = "People: \(people)"
    //            tipLabel.text = "Tip: \(tip)% (\(tipAmount.rounded()))"
    //            billLabel.text = "Bill: \(firstBill)"
    //            totalLabel.text = "Total bill: \(totalBill)"
    //        eachLabel.text = "Each: \(eachBill)"
    //        }
    //    @objc func goBack() {
    //        _ = self.navigationController?.popToRootViewController(animated:
    //                true)
    //              dismiss(animated: true, completion: nil)
    //
    //    }
}

