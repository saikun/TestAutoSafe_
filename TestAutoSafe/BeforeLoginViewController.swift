//
//  BeforeLoginViewController.swift
//  TestAutoTrack
//
//  Created by name name on 2017/07/31.
//  Copyright © 2017年 name name. All rights reserved.
//

import UIKit

class BeforeLoginViewController: UIViewController {
    @IBAction func tapGoLogin(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "LoginView", bundle: .main)
        let vc:LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        let navController = UINavigationController(rootViewController: vc)
        
        self.navigationController?.presentSafe(navController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func tapCopy(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let pasteboard: UIPasteboard = UIPasteboard.general
        pasteboard.string = appDelegate.log
        
        textView.text = appDelegate.log
    }
    
}
