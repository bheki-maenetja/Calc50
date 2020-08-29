//
//  HomeViewController.swift
//  Calc50
//
//  Created by Bheki Maenetja on 2020/08/29.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func simpleCalcSegue(_ sender: UIButton) {
        switch String(sender.title(for: .normal)!) {
        case "Simple Calculator":
            self.tabBarController?.selectedIndex = 1
        case "Advanced Calculator":
            self.tabBarController?.selectedIndex = 2
        case "Date Calculator":
            self.tabBarController?.selectedIndex = 3
        case "Unit Converter":
            self.tabBarController?.selectedIndex = 4
        default:
            print("Nothing...")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
