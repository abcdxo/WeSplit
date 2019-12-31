//
//  ViewController.swift
//  Split
//
//  Created by Nick Nguyen on 12/22/19.
//  Copyright © 2019 Nick Nguyen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    var soundOn: Bool = false
     
    @IBOutlet weak var dotLabel: UIButton!
    @IBOutlet weak var nextLabel: UIButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var settingButton: UIBarButtonItem!
    @IBOutlet weak var changeThemeButton: UIBarButtonItem!
    
    @IBOutlet weak var zeroNumLabel: UIButton!
    
    var hasText = false
    let transition = SlideInTransition()
    var menuShowing = false
    let pianoSound = URL(fileURLWithPath: Bundle.main.path(forResource: "multimedia_button_click_007", ofType: "mp3")!)
    var audioPlayer : AVAudioPlayer!
    let currencyFormatter = NumberFormatter()
    var isTapped = true
    
    var number = "" {
        didSet {
            nextLabel.isEnabled = !(number.count == 0)
            dotLabel.isEnabled = !(number.count == 0)
            zeroNumLabel.isEnabled = !(number.count == 0)
        }
    }
    @IBAction func numberTapped(_ sender: UIButton) {
     soundOn = userDefaults.bool(forKey: "SoundValue")
            if soundOn == true {
                audioPlayer = try! AVAudioPlayer(contentsOf: pianoSound)
                audioPlayer.play()
            }
//            audioPlayer = try! AVAudioPlayer(contentsOf: pianoSound)
//            audioPlayer.play()
       
        if number.count < 9  {
            number.append(sender.currentTitle!)
//            currencyFormatter.usesGroupingSeparator = true
//            currencyFormatter.numberStyle = .decimal
//            currencyFormatter.locale = Locale.current
//            let priceString = currencyFormatter.string(from: NSNumber(value: Double(number)!))
            numberLabel.text = number
        }
        if sender.currentTitle == "." && number.contains(".")  {
            sender.isEnabled = false
//            var priceString = currencyFormatter.string(from: NSNumber(value: Double(number)!))
//            priceString! += sender.currentTitle!
            numberLabel.text = number
        } else if number.contains(".") {
           
             dotLabel.isEnabled = false
        }
    }
    
    @IBAction func trashTapped(_ sender: UIButton) {
        number.removeAll()
        numberLabel.text = number
    }
    
    @IBAction func settingButtonTapped(_ sender: UIBarButtonItem) {
         let menuViewController = storyboard?.instantiateViewController(withIdentifier: "Setting") as! MenuViewController 
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
//          menuViewController.delegate = self
//        addChild(menuViewController)
//        view.addSubview(menuViewController.view)
//        willMove(toParent: self)
//        didMove(toParent: self)
        present(menuViewController,animated: true)
      let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
           transition.dimmingView.addGestureRecognizer(tap)
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
         dismiss(animated: true, completion: nil)
     }
    func themeGoOut() {
        trailingConstraint.constant = -150
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
    func themeGoIn() {
        trailingConstraint.constant = 0
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func changeThemeButtonTapped(_ sender: UIBarButtonItem) {
        
        if (menuShowing) {
            themeGoOut()
            
        } else {
            themeGoIn()
        }
        menuShowing = !menuShowing
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        if number.contains(".") {
                   dotLabel.isEnabled = false
               }
          soundOn = userDefaults.bool(forKey: "SoundValue")

//        let tapGestureRecognizer = UITapGestureRecognizer()
//           tapGestureRecognizer.numberOfTouchesRequired = 1
//           tapGestureRecognizer.numberOfTapsRequired = 1
//           tapGestureRecognizer.addTarget(self, action: #selector(userTapped(_:)))

        
    }
    
    @IBAction func unwindToOne(_ sender: UIStoryboardSegue) {
        
    }
//    @objc func userTapped(_ : UITapGestureRecognizer) {
//      //Handle the tap here
//      // i.e. slide out the menu
//      print("Tapped")
//    }
     
     
    func setUpUI() {
        navigationController?.navigationBar.tintColor = .black
        trailingConstraint.constant = -150
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .white
    }
    
    @IBAction func colorChanged(_ sender: UIButton) {
        numberLabel.textColor = sender.backgroundColor
        nextLabel.setTitleColor(sender.backgroundColor, for: .normal) 
        mainView.backgroundColor = sender.backgroundColor
        self.navigationController?.navigationBar.barStyle = .black
        navigationController!.navigationBar.tintColor = sender.backgroundColor
        navigationItem.leftItemsSupplementBackButton = false
        themeGoOut()
        menuShowing = !menuShowing
        
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Next" {
            let destVC = segue.destination as! DetailViewController
            destVC.buttonColor = mainView.backgroundColor
            destVC.view.backgroundColor = view.backgroundColor
            destVC.moneyLabel.text = numberLabel.text
            destVC.moneyLabel.textColor = view.backgroundColor
            destVC.initialAmount = Double(numberLabel.text!)!
            
        }
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }

}
//extension ViewController: MenuDelegate {
//    func didSelectOption(option: String) {
//       print("")
//    }
//
//
//}


