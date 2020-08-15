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
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var operatorButtons: [UIButton]!
    @IBOutlet var otherButtons: [UIButton]!
    
    var firstNumber : Float? = nil
    var secondNumber : Float? = nil
    var currentOperator : Character = "0"
    var numberText : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerText.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTap(_ sender: UIButton) {
        if firstNumber != nil {
            answerText.text = ""
        }
        let buttonSymbol = String(sender.title(for: .normal)!)
        numberText = answerText.text!
        if numberButtons.contains(sender) || buttonSymbol == "." {
            if !(numberText.contains(".")) || buttonSymbol != "." {
                answerText.text = "\(String(numberText))\(buttonSymbol)"
            }
        } else if operatorButtons.contains(sender) && buttonSymbol != "=" {
            if !(firstNumber != nil) {
                setNumber(text: numberText, numChoice: 1)
                print("First Number: \(firstNumber), Second Number: \(secondNumber)")
            } else {
                setNumber(text: numberText, numChoice: 2)
                print("First Number: \(firstNumber), Second Number: \(secondNumber)")
            }
            resetOperatorButtons()
            sender.backgroundColor = .systemYellow
        } else if buttonSymbol == "Clear" {
            firstNumber = 0
            secondNumber = 0
            answerText.text = ""
            resetOperatorButtons()
        }
    }
    
    func calculate(currentOperator : Character, firstNumber : Float, secondNumber : Float) -> Float {
        switch currentOperator {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "x":
            if secondNumber > 0 {
                return firstNumber * secondNumber
            } else {
                return firstNumber * firstNumber
            }
        case "÷":
            if secondNumber > 0 {
                return firstNumber / secondNumber
            } else {
                return firstNumber / firstNumber
            }
        default:
            return -1
        }
    }
    
    func setNumber(text : String, numChoice : Int) {
        let newNum = Float(text)
        if numChoice == 1 {
            firstNumber = newNum!
        } else if numChoice == 2 {
            secondNumber = newNum!
        }
    }
    
    func resetOperatorButtons() {
        for button in operatorButtons {
            button.backgroundColor = .systemRed
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
