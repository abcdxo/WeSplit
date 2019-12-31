//
//  DetailViewController.swift
//  Split
//
//  Created by Nick Nguyen on 12/22/19.
//  Copyright © 2019 Nick Nguyen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController , UINavigationControllerDelegate,UIViewControllerTransitioningDelegate {
    let userDefaults = UserDefaults.standard
    public var initialAmount: Double = 0
    public var totalBill = 0.0
    public var each = 0.0
    public var tipAmount = 0.0
    public var newEach = 0.0
    
    @IBOutlet weak var doneButton: UIButton!
    var buttonColor: UIColor?
    
    @IBOutlet var detailMainView: UIView!
    @IBOutlet weak var peopleImage: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var numberPeopleLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!
   
    var tip = 0 {
        didSet {
            tipLabel.text = "\(tip) %"
        }
    }
    
    var people : Int = 1 {
        didSet {
            numberPeopleLabel.text = "\(people)"
        }
    }
    @IBAction func changeThemeTapped(_ sender: UIBarButtonItem) {
    }
    
    
    @IBAction func lessTipTapped(_ sender: UIButton) {
        if tip > 0 {
            tip -= 5
           let value = initialAmount
            let plusAmount = (value * (Double(tip) * 0.01 ))
            tipAmount = plusAmount
            let newValue = value + plusAmount
            totalBill = newValue
//            moneyLabel.text = "\(newValue)"
             moneyLabel.text =  String(format: "%.2f", newValue)
        }
    }
    
    @IBAction func moreTipTapped(_ sender: UIButton) {
        tip += 5
        let value = initialAmount
        let plusAmount = (value * (Double(tip) * 0.01 ))
        tipAmount = plusAmount
        let newValue = value + plusAmount
        totalBill = newValue
        let result = newValue / Double(people)
        newEach = result
        moneyLabel.text =  String(format: "%.2f", result)
    }
    @IBAction func lessPeopleTapped(_ sender: UIButton) {
        if people > 1 {
            people -= 1
            let value = initialAmount
            let plusAmount = (value * (Double(tip) * 0.01 ))
            let newValue = value + plusAmount
            let result = newValue / Double(people)
            each = result
            moneyLabel.text = String(format: "%.2f", result)
        } else {
            return
        }
        switch people {
        case 1: peopleImage.image = UIImage(systemName: "person")
        case 2 : peopleImage.image = UIImage(systemName: "person.2")
        case 3 :peopleImage.image = UIImage(systemName: "person.3")
        default:peopleImage.image = UIImage(systemName: "person.3")
        }
    }
    @IBAction func morePeopleTapped(_ sender: UIButton) {
        people += 1
        let value = initialAmount
        let plusAmount = (value * (Double(tip) * 0.01 ))
        let newValue = value + plusAmount
        let result = newValue / Double(people)
        each = result
        moneyLabel.text = String(format: "%.2f", result)
        switch people {
        case 1: peopleImage.image = UIImage(systemName: "person")
        case 2:peopleImage.image = UIImage(systemName: "person.2")
        case 3:peopleImage.image = UIImage(systemName: "person.3")
        default: peopleImage.image = UIImage(systemName: "person.3")
        }
    }
    @IBAction func doneTapped(_ sender: UIButton) {
       
    }
    
    func setUpForResult() {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Done" {
            let destVC = segue.destination as! ResultViewController
            destVC.color = view.backgroundColor ?? UIColor.red
         
             
            if tip == 0 && people == 1 {
                
                destVC.firstBill = "\(Double(initialAmount))"
                destVC.people = people
                destVC.tip = tip
                destVC.totalBill = "\(Int(initialAmount))"
                destVC.eachBill = "\(Int(initialAmount))"
                destVC.tipAmount = tipAmount
            } else if tip == 0 && people != 1 {
                 
                destVC.firstBill = "\(Double(initialAmount))"
                destVC.people = people
                destVC.tip = tip
                destVC.totalBill = "\(Int(initialAmount))"
                destVC.eachBill = "\(Int(each))"
                destVC.tipAmount = tipAmount
            } else if tip != 0 && people == 1 {
               
                destVC.firstBill = "\(Double(initialAmount))"
                destVC.people = people
                destVC.tip = tip
                destVC.totalBill = "\(Int(totalBill))"
                destVC.eachBill = "\(Int(totalBill))"
                destVC.tipAmount = tipAmount
            }
            else {
                
                destVC.firstBill = "\(Double(initialAmount))"
                destVC.people = people
                destVC.tip = tip
                destVC.totalBill = "\(Int(totalBill))"
                destVC.eachBill = "\(Int(each))"
                destVC.tipAmount = tipAmount
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.setTitleColor(buttonColor, for: .normal)
       
    }
    

  
}
