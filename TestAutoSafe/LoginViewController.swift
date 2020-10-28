//
//  LoginViewController.swift
//  TestAutoTrack
//
//  Created by name name on 2017/07/31.
//  Copyright © 2017年 name name. All rights reserved.
//

import UIKit

class LoginViewController:  UIViewController{
    
    @IBOutlet weak var iddr: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ex
        let array:[String] = ["",""]
        let str = array[2]
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:  #selector(buttonTapped(_:)))
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        
        if iddr.text?.characters.count == 0 && pass.text?.characters.count == 0 {
            let alert = UIAlertController(title:"Error", message: "count 0", preferredStyle: UIAlertControllerStyle.alert)
            let action1 = UIAlertAction(title: "Action", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) in
                print("Action")
            })
            
            let cancel = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel, handler: {
                (action: UIAlertAction!) in
                print("cancel")
            })
            alert.addAction(action1)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
            
        }else{
            let storyboard = UIStoryboard.init(name: "AfterLoginView", bundle: .main)
            let vc:AfterLoginViewController = storyboard.instantiateViewController(withIdentifier: "AfterLoginViewController") as! AfterLoginViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func buttonTapped(_ sender : UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}
