//
//  MenuViewController.swift
//  Split
//
//  Created by Nick Nguyen on 12/23/19.
//  Copyright © 2019 Nick Nguyen. All rights reserved.
//

import UIKit
import MessageUI

//protocol MenuDelegate {
//    func didSelectOption(option: String)
//}

enum MenuType: Int {
    case setting
    case feedback
    case about
}

class MenuViewController: UITableViewController, MFMailComposeViewControllerDelegate {
//    var delegate: MenuDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
//        let tapGestureRecognizer = UISwipeGestureRecognizer()
//        tapGestureRecognizer.numberOfTouchesRequired = 1
//        tapGestureRecognizer.direction = .left
//        tapGestureRecognizer.addTarget(self, action: #selector(userTapped(_:)))
//
//        view.addGestureRecognizer(tapGestureRecognizer)
//        tableView.tableFooterView = UIView()
//        tableView.reloadData()
//        tableView.dataSource = self
        
    }
//    @objc func userTapped(_ : UITapGestureRecognizer) {
//        removefromParentVC()
//    }
//    private func removefromParentVC() {
//        UIView.animate(withDuration: 0.8, animations: {
//             self.view.frame.origin.x = self.parent!.view.frame.origin.x - self.parent!.view.frame.width
//        }) { _ in
//            self.willMove(toParent: nil)
//            self.removeFromParent()
//            self.view.removeFromSuperview()
//        }
//    }
//    override func willMove(toParent parent: UIViewController?) {
//        if parent != nil {
//            self.view.frame.origin.x = parent!.view.frame.origin.x - parent!.view.frame.width
//            UIView.animate(withDuration: 0.8) {
//                self.view.frame.origin.x = parent!.view.frame.origin.x
//            }
//        }
//    }
//    
//    override func didMove(toParent parent: UIViewController?) {
//        
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        switch menuType {
        case .about:
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "About") else { return  }
        present(vc, animated: true, completion: nil)
        case .feedback:
           sendEmail()
        case .setting:
            guard let settingVC = storyboard?.instantiateViewController(withIdentifier: "SettingsPick") else { return }
            present(settingVC, animated: true, completion: nil)
      
        }
    }
  func sendEmail() {
      if MFMailComposeViewController.canSendMail() {
          let mail = MFMailComposeViewController()
          mail.mailComposeDelegate = self
          mail.setToRecipients(["ptnguyen1901@gmail.com"])
          mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

          present(mail, animated: true)
      } else {
        let ac = UIAlertController(title: "Error sending email", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        present(ac, animated: true)
      }
  }

  func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    
    if let _ = error {
        controller.dismiss(animated: true)
    }
    switch result {
    case .cancelled:
       controller.dismiss(animated: true)
    default:
       controller.dismiss(animated: true)
    }
  }
}
