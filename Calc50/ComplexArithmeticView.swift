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
            mainNumber = calculateValue(operatorSymbol: buttonSymbol)
            print(mainNumber)
            numberText = mainNumber! - Float(Int(mainNumber!)) == 0.0 ? "\(Int(mainNumber!))" : "\(mainNumber!)"
            answerText.text = numberText
        }
    }
    
    func calculateValue(operatorSymbol : String) -> Float {
        switch operatorSymbol {
        case "Abs":
            print("Abosolute value incoming...")
            return abs(mainNumber!)
        case "1/x":
            print("Reciporacal incoming...")
            return 1 / mainNumber!
        case "rad":
            print("Radians incoming...")
            return deg2rad(mainNumber!)
        case "deg":
            print("Degrees incoming...")
            return rad2deg(mainNumber!)
        case "x²":
            print("Squares incoming...")
            return pow(mainNumber!, 2)
        case "x³":
            print("Cubes incoming...")
            return pow(mainNumber!, 3)
        case "√x":
            print("Square roots incoming...")
            return sqrt(mainNumber!)
        case "∛x":
            print("Cube roots incoming...")
            return pow(mainNumber!, 1/3)
        case "%":
            print("Percent incoming...")
            return 0.01 * mainNumber!
        case "sin":
            print("Sin incoming...")
            return sin(mainNumber!)
        case "cos":
            print("Cos incoming...")
            return cos(mainNumber!)
        case "tan":
            print("Tangent incoming...")
            return tan(mainNumber!)
        case "arcsin":
            print("Arc sin ... incoming")
            return asin(mainNumber!)
        case "arccos":
            print("Arc cos ... incoming")
            return acos(mainNumber!)
        case "arctan":
            print("Arc tan ... incoming")
            return atan(mainNumber!)
        case "cosec":
            print("Cosecant ... incoming")
            return 1 / sin(mainNumber!)
        case "sec":
            print("Secant ... incoming")
            return 1 / cos(mainNumber!)
        case "cot":
            print("Cotangent ... incoming")
            return 1 / tan(mainNumber!)
        case "log":
            print("Logarithm ... incoming")
            return log10(mainNumber!)
        case "ln":
            print("Natural logarithm ... incoming")
            return log(mainNumber!)
        default:
            return -1
        }
    }
    
    func deg2rad(_ number: Float) -> Float {
        return number * .pi / 180
    }
    
    func rad2deg(_ number: Float) -> Float {
        return (number / .pi) * 180
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
