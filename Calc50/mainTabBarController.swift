//
//  mainTabBarController.swift
//  Calc50
//
//  Created by Bheki Maenetja on 2020/08/29.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class mainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func simpleCalcSegue(_ sender: UIButton) {
        self.selectedIndex = 1
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
