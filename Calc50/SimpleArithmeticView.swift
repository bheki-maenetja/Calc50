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
    var currentOperator : String = ""
    var numberText : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerText.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTap(_ sender: UIButton) {
        if firstNumber != nil && numberText == "" {
            numberText = ""
        }
        let buttonSymbol = String(sender.title(for: .normal)!)
        
        switch buttonSymbol {
        case ".", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            if !(numberText.contains(".")) || buttonSymbol != "." {
                numberText = "\(numberText)\(buttonSymbol)"
            }
        case "+", "-", "x", "÷":
            resetOperatorButtons()
            sender.backgroundColor = .systemYellow
            if firstNumber == nil {
                setNumber(text: numberText, numChoice: 1)
                answerText.text = numberText
                numberText = ""
                currentOperator = buttonSymbol
                return
            } else {
                if numberText != "" {
                    setNumber(text: numberText, numChoice: 2)
                    firstNumber = calculate(currentOperator: currentOperator, firstNumber: firstNumber!, secondNumber: secondNumber!)
                }
                secondNumber = nil
                answerText.text = firstNumber! - Float(Int(firstNumber!)) == 0.0 ? "\(Int(firstNumber!))" : "\(firstNumber!)"
                numberText = ""
                currentOperator = buttonSymbol
                return
            }
        case "=":
            resetOperatorButtons()
            sender.backgroundColor = .systemOrange
            if firstNumber != nil && numberText != "" {
                setNumber(text: numberText, numChoice: 2)
            }
            if firstNumber != nil && secondNumber != nil {
                print("Operating on two numbers...")
            } else if firstNumber != nil && currentOperator != nil {
                print("Operating on one number...")
            }
        case "Clear":
            firstNumber = nil
            secondNumber = nil
            numberText = ""
            resetOperatorButtons()
        default:
            print("Nothing...")
        }
        print("First Number: \(firstNumber), Second Number: \(secondNumber)")
        answerText.text = numberText
    }
    
    func calculate(currentOperator : String, firstNumber : Float, secondNumber : Float) -> Float {
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
            return firstNumber
        }
    }
    
    func setNumber(text : String, numChoice : Int) {
        if text != "" {
            let newNum = Float(text)
            if numChoice == 1 {
                firstNumber = newNum!
            } else if numChoice == 2 {
                secondNumber = newNum!
            }
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
