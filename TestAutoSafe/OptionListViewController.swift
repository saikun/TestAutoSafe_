//
//  OptionListViewController.swift
//  TestAutoTrack
//
//  Created by name name on 2017/07/31.
//  Copyright © 2017年 name name. All rights reserved.
//

import Foundation
import UIKit

class OptionListViewController: UITableViewController{
    var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        
        cell.textLabel?.text = fruits[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard.init(name: "PageDataView", bundle: .main)
        let vc:PageDataViewController = storyboard.instantiateViewController(withIdentifier: "PageDataViewController") as! PageDataViewController
        vc.dataObject = fruits[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
