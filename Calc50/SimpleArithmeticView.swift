//
//  SimpleArithmeticView.swift
//  Calc50
//
//  Created by Bheki Maenetja on 2020/08/07.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class SimpleArithmeticView: UIViewController {

    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var expressionText: UILabel!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var operatorButtons: [UIButton]!
    @IBOutlet var otherButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerText.text = ""
        expressionText.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTap(_ sender: UIButton) {
        let buttonSymbol = String(sender.title(for: .normal)!)
        if numberButtons.contains(sender) {
            answerText.text = "\(String(answerText.text!))\(buttonSymbol)"
            expressionText.text = "\(String(expressionText.text!))\(buttonSymbol)"
        } else if operatorButtons.contains(sender) && buttonSymbol != "=" {
            expressionText.text = "\(String(expressionText.text!))\(buttonSymbol)"
        } else if buttonSymbol == "Clear" {
            answerText.text = ""
            expressionText.text = ""
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
