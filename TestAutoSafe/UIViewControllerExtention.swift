//
//  UIViewControllerExtention.swift
//  TestAutoSafe
//
//  Created by name name on 2018/05/15.
//  Copyright © 2018年 name name. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentSafe(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Swift.Void)? = nil) {
        if isSafeVC(vc: viewControllerToPresent) {
            self.present(viewControllerToPresent, animated: animated, completion: completion)
        } else {
            let alert = UIAlertController(title:"操作を続けますか？", message: "この操作によりアプリケーションは正しく終了しませんでした。\(self.classNameAsString(obj: viewControllerToPresent))", preferredStyle: UIAlertControllerStyle.alert)
            let action1 = UIAlertAction(title: "続ける", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) in
                print("Action")
                self.present(viewControllerToPresent, animated: animated, completion: completion)
            })
            
            let cancel = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler: {
                (action: UIAlertAction!) in
                print("cancel")
            })
            alert.addAction(action1)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func isSafeVC(vc: UIViewController) -> Bool {
        
        if let crashReporter = PLCrashReporter.shared() {
            
            //ほんとはクラス判定して返したいけど、まだできてないから、とりあえず、クラッシュあったらtrueで返す。
            if crashReporter.hasPendingCrashReport() {
                return false
            }
        }
        return true
    }
    
    func classNameAsString(obj: Any) -> String {
        return String(describing: type(of: obj))
    }
}
