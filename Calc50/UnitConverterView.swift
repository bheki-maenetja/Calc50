//
//  UnitConverterView.swift
//  Calc50
//
//  Created by Bheki Maenetja on 2020/08/07.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class UnitConverterView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
        
    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var firstUnitPicker: UIPickerView!
    @IBOutlet weak var secondUnitPicker: UIPickerView!
    @IBOutlet weak var textField: UITextField!
    
    var mainNumber : Float? = nil
    
    var unitCategories: [String] = ["Temperature", "Mass", "Force", "Distance", "Time"]
    
    var units : [String : [String]] = [
        "Temperature" : ["Celsius", "Kelvin", "Fahrenheit"],
        "Mass" : ["Kilogram", "Gram", "Tonne", "Ounce", "Milligram"],
        "Force" : ["Newton", "Pound", "Kip"],
        "Distance" : ["Metre", "Yard", "Kilometre", "Mile", "Lightyear"],
        "Time" : ["Second", "Minute", "Hour", "Day"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        answerText.text = ""
        
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        
        self.firstUnitPicker.delegate = self
        self.firstUnitPicker.dataSource = self
        
        self.secondUnitPicker.delegate = self
        self.secondUnitPicker.dataSource = self
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
    
    @IBAction func convertUnits(_ sender: UIButton) {
        textField.endEditing(true)
        mainNumber = textField.text != "" ? Float(textField.text!) : nil
        if mainNumber != nil {
            answerText.text = "\(mainNumber!)"
            handleCategory(chosenCategory: unitCategories[categoryPicker.selectedRow(inComponent: 0)])
        } else {
            answerText.text = ""
        }
    }
    
    func handleCategory(chosenCategory : String) {
        switch chosenCategory {
        case "Temperature":
            print("Will convert temperature...")
            mainNumber = convertTemperature()
            answerText.text = "\(mainNumber!)"
        case "Mass":
            print("Will convert mass...")
        case "Force":
            print("Will convert force...")
        case "Distance":
            print("Will convert distance...")
        case "Time":
            print("Will convert time...")
        default:
            print("Nothing...")
        }
    }
    
    func convertTemperature() -> Float {
        let firstUnit = units["Temperature"]![firstUnitPicker.selectedRow(inComponent: 0)]
        let secondUnit = units["Temperature"]![secondUnitPicker.selectedRow(inComponent: 0)]
        
        if firstUnit == secondUnit {
            return mainNumber!
        } else {
            var tempInCelsius : Float? = nil
            
            switch firstUnit {
            case "Celsius":
                tempInCelsius = mainNumber!
            case "Kelvin":
                tempInCelsius = mainNumber! - 273.15
            case "Fahrenheit":
                tempInCelsius = 5/9 * (mainNumber! - 32)
            default:
                print("Nothing...")
            }
            
            switch secondUnit {
            case "Kelvin":
                return tempInCelsius! + 273.15
            case "Fahrenheit":
                return (tempInCelsius! * 1.8) + 32
            default:
                return -1
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoryPicker {
            print("Changing category...")
            firstUnitPicker.reloadAllComponents()
            secondUnitPicker.reloadAllComponents()
            
            firstUnitPicker.selectRow(0, inComponent: 0, animated: true)
            secondUnitPicker.selectRow(0, inComponent: 0, animated: true)
            mainNumber = nil
            answerText.text = ""
            textField.text = ""
        } else if pickerView == firstUnitPicker {
            print("Changing first unit...")
        } else if pickerView == secondUnitPicker {
            print("Changing second unit...")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPicker {
            return unitCategories.count
        } else {
            return units[unitCategories[categoryPicker.selectedRow(inComponent: 0)]]!.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == categoryPicker {
            return unitCategories[row]
        } else if pickerView == firstUnitPicker || pickerView == secondUnitPicker {
            return units[unitCategories[categoryPicker.selectedRow(inComponent: 0)]]![row]
        } else {
            return "Nothing"
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
