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
    
    var mainValue : Float? = nil
    
    var unitCategories: [String] = ["Temperature", "Mass", "Force", "Distance", "Time"]
    
    var units : [String : [String]] = [
        "Temperature" : ["Celsius", "Kelvin", "Fahrenheit"],
        "Mass" : ["Kilogram", "Gram", "Tonne", "Ounce", "Milligram"],
        "Force" : ["Newtom", "Pound", "Kip"],
        "Distance" : ["Metre", "Yard", "Kilometre", "Mile", "Lightyear"],
        "Time" : ["Second", "Minute", "Hour", "Day"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        mainValue = textField.text != "" ? Float(textField.text!) : 0
        answerText.text = "\(mainValue)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoryPicker {
            print("Changing category...")
            firstUnitPicker.reloadAllComponents()
            secondUnitPicker.reloadAllComponents()
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
