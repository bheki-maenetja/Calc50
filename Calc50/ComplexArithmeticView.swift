//
//  ComplexArithmeticView.swift
//  Calc50
//
//  Created by Bheki Maenetja on 2020/08/07.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class ComplexArithmeticView: UIViewController {
    
    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var mainNumber: Float? = nil
    var numberText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerText.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func textFieldAction(_ sender: UITextField) {
        var textFieldText = String(textField.text!)
        if textFieldText == "" {
            return
        }
        if textFieldText.components(separatedBy: ".").count > 2 {
            textFieldText.remove(at: textFieldText.lastIndex(of: ".")!)
        }
        textField.text = textFieldText
    }
    
    @IBAction func setValue(_ sender: Any) {
        textField.endEditing(true)
        if textField.text == "" {
            numberText = ""
        } else {
            mainNumber = Float(textField.text!)
            numberText = mainNumber! - Float(Int(mainNumber!)) == 0.0 ? "\(Int(mainNumber!))" : "\(mainNumber!)"
        }
        answerText.text = numberText
    }
    
    @IBAction func buttonTap(_ sender: UIButton) {
        let buttonSymbol = String(sender.title(for: .normal)!)
        if !textField.isEditing && numberText != "" {
            print(buttonSymbol)
            calculateValue(operatorSymbol: buttonSymbol)
        }
    }
    
    func calculateValue(operatorSymbol : String) -> Float {
        switch operatorSymbol {
        case "Abs":
            print("Abosolute value incoming...")
            return -1
        case "n!":
            print("Factorial incoming...")
            return -1
        case "rad":
            print("Radians incoming...")
            return -1
        case "deg":
            print("Degrees incoming...")
            return -1
        case "x²":
            print("Squares incoming...")
            return -1
        case "x³":
            print("Cubes incoming...")
            return -1
        case "√x":
            print("Square roots incoming...")
            return -1
        case "∛x":
            print("Cube roots incoming...")
            return -1
        case "n√x":
            print("Nth root incoming...")
            return -1
        case "sin":
            print("Sin incoming...")
            return -1
        case "cos":
            print("Cos incoming...")
            return -1
        case "tan":
            print("Tangent incoming...")
            return -1
        case "arcsin":
            print("Arc sin ... incoming")
            return -1
        case "arccos":
            print("Arc cos ... incoming")
            return -1
        case "arctan":
            print("Arc tan ... incoming")
            return -1
        case "cosec":
            print("Cosecant ... incoming")
            return -1
        case "sec":
            print("Secant ... incoming")
            return -1
        case "cot":
            print("Cotangent ... incoming")
            return -1
        case "log":
            print("Logarithm ... incoming")
            return -1
        case "ln":
            print("Natural logarithm ... incoming")
            return -1
        default:
            return -1
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
