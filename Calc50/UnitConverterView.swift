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
    
    var unitCategories: [String] = ["Area", "Energy", "Length", "Mass", "Speed", "Temperature", "Time", "Volume"]
    
    var units : [String : [String]] = [
        "Area": ["Square Metre", "Square Foot", "Square Inch", "Square Yard", "Square Kilometre", "Square Mile", "Hectare", "Acre"],
        "Energy" : ["Joule", "Kilojoule", "Calorie", "Kilocalorie", "Watt Hour", "Kilowatt Hour"],
        "Length" : ["Metre", "Centimetre", "Micrometre", "Nanometre", "Foot", "Inch", "Yard", "Kilometre", "Mile", "Nautical Mile"],
        "Mass" : ["Gram", "Kilogram", "Milligram", "Microgram", "Ounce", "Tonne", "Stone"],
        "Speed" : ["Metres per second", "Kilometres per hour", "Miles per hour", "Knot"],
        "Temperature" : ["Celsius", "Kelvin", "Fahrenheit"],
        "Time" : ["Second", "Minute", "Hour", "Day", "Week", "Millisecond", "Microsecond", "Nanosecond"],
        "Volume": ["Litre", "Millilitre", "Gallon", "Pint", "Cubic Metre"],
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
        case "Area":
            print("Will convert area...")
            mainNumber = convertArea()
            answerText.text = "\(mainNumber!)"
        case "Energy":
            print("Will convert energy...")
            mainNumber = convertEnergy()
            answerText.text = "\(mainNumber!)"
        case "Length":
            print("Will convert length...")
            mainNumber = convertLength()
            answerText.text = "\(mainNumber!)"
        case "Mass":
            print("Will convert mass...")
            mainNumber = convertMass()
            answerText.text = "\(mainNumber!)"
        case "Speed":
            print("Will convert speed...")
            mainNumber = convertSpeed()
            answerText.text = "\(mainNumber!)"
        case "Temperature":
            print("Will convert temperature...")
            mainNumber = convertTemperature()
            answerText.text = "\(mainNumber!)"
        case "Time":
            print("Will convert time...")
            mainNumber = convertTime()
            answerText.text = "\(mainNumber!)"
        case "Volume":
            print("Will convert volume...")
            mainNumber = convertVolume()
            answerText.text = "\(mainNumber!)"
        default:
            print("Nothing...")
        }
    }
    
    func convertArea() -> Float {
        let firstUnit = units["Area"]![firstUnitPicker.selectedRow(inComponent: 0)]
        let secondUnit = units["Area"]![secondUnitPicker.selectedRow(inComponent: 0)]
        
        if firstUnit == secondUnit {
            return mainNumber!
        } else {
            var areaInSquareMetres : Float? = nil
            
            switch firstUnit {
            case "Square Metre":
                areaInSquareMetres = mainNumber!
            case "Square Foot":
                areaInSquareMetres = mainNumber! / 10.764
            case "Square Inch":
                areaInSquareMetres = mainNumber! / 1550
            case "Square Yard":
                areaInSquareMetres = mainNumber! / 1.196
            case "Square Kilometre":
                areaInSquareMetres = mainNumber! * pow(10, 6)
            case "Square Mile":
                areaInSquareMetres = mainNumber! * (2.59 * pow(10, 6))
            case "Hectare":
                areaInSquareMetres = mainNumber! * 10000
            case "Acre":
                areaInSquareMetres = mainNumber! * 4047
            default:
                print("Nothing...")
            }
            
            switch secondUnit {
            case "Square Metre":
                return areaInSquareMetres!
            case "Square Foot":
                return areaInSquareMetres! * 10.764
            case "Square Inch":
                return areaInSquareMetres! * 1550
            case "Square Yard":
                return areaInSquareMetres! * 1.196
            case "Square Kilometre":
                return areaInSquareMetres! / pow(10, 6)
            case "Square Mile":
                return areaInSquareMetres! / (2.59 * pow(10, 6))
            case "Hectare":
                return areaInSquareMetres! / 10000
            case "Acre":
                return areaInSquareMetres! / 4047
            default:
                return -1
            }
        }
    }
    
    func convertEnergy() -> Float {
        let firstUnit = units["Energy"]![firstUnitPicker.selectedRow(inComponent: 0)]
        let secondUnit = units["Energy"]![secondUnitPicker.selectedRow(inComponent: 0)]
        
        if firstUnit == secondUnit {
            return mainNumber!
        } else {
            var energyInJoules : Float? = nil
            
            switch firstUnit {
            case "Joule":
                energyInJoules = mainNumber!
            case "Kilojoule":
                energyInJoules = mainNumber! * 1000
            case "Calorie":
                energyInJoules = mainNumber! * 4.184
            case "Kilocalorie":
                energyInJoules = mainNumber! * 4184
            case "Watt Hour":
                energyInJoules = mainNumber! * 3600
            case "Kilowatt Hour":
                energyInJoules = mainNumber! * (3.6 * pow(10, 6))
            default:
                print("Nothing...")
            }
            
            switch secondUnit {
            case "Joule":
                return energyInJoules!
            case "Kilojoule":
                return energyInJoules! / 1000
            case "Calorie":
                return energyInJoules! / 4.184
            case "Kilocalorie":
                return energyInJoules! / 4184
            case "Watt Hour":
                return energyInJoules! / 3600
            case "Kilowatt Hour":
                return energyInJoules! / (3.6 * pow(10, 6))
            default:
                return -1
            }
        }
    }
    
    func convertLength() -> Float {
        let firstUnit = units["Length"]![firstUnitPicker.selectedRow(inComponent: 0)]
        let secondUnit = units["Length"]![secondUnitPicker.selectedRow(inComponent: 0)]
        
        if firstUnit == secondUnit {
            return mainNumber!
        } else {
            var lengthInMetres : Float? = nil
            
            switch firstUnit {
            case "Metre":
                lengthInMetres = mainNumber!
            case "Centimetre":
                lengthInMetres = mainNumber! / 100
            case "Micrometre":
                lengthInMetres = mainNumber! / pow(10, 6)
            case "Nanometre":
                lengthInMetres = mainNumber! / pow(10, 9)
            case "Foot":
                lengthInMetres = mainNumber! / 3.281
            case "Yard":
                lengthInMetres = mainNumber! / 1.094
            case "Inch":
                lengthInMetres = mainNumber! / 39.37
            case "Kilometre":
                lengthInMetres = mainNumber! * 1000
            case "Mile":
                lengthInMetres = mainNumber! * 1609
            case "Nautical Mile":
                lengthInMetres = mainNumber! * 1852
            default:
                print("Nothing...")
            }
            
            switch secondUnit {
            case "Metre":
                return lengthInMetres!
            case "Centimetre":
                return lengthInMetres! * 100
            case "Micrometre":
                return lengthInMetres! * pow(10, 6)
            case "Nanometre":
                return lengthInMetres! * pow(10, 9)
            case "Foot":
                return lengthInMetres! * 3.281
            case "Yard":
                return lengthInMetres! * 1.094
            case "Inch":
                return lengthInMetres! * 39.37
            case "Kilometre":
                return lengthInMetres! / 1000
            case "Mile":
                return lengthInMetres! / 1609
            case "Nautical Mile":
                return lengthInMetres! / 1852
            default:
                return -1
            }
        }
    }
    
    func convertMass() -> Float {
        let firstUnit = units["Mass"]![firstUnitPicker.selectedRow(inComponent: 0)]
        let secondUnit = units["Mass"]![secondUnitPicker.selectedRow(inComponent: 0)]
        
        if firstUnit == secondUnit {
            return mainNumber!
        } else {
            var massInGrams : Float? = nil
            
            switch firstUnit {
            case "Gram":
                massInGrams = mainNumber!
            case "Kilogram":
                massInGrams = mainNumber! * 1000
            case "Milligram":
                massInGrams = mainNumber! / 1000
            case "Microgram":
                massInGrams = mainNumber! / pow(10, 6)
            case "Ounce":
                massInGrams = mainNumber! * 28.35
            case "Tonne":
                massInGrams = mainNumber! * pow(10, 6)
            case "Stone":
                massInGrams = mainNumber! * 6350
            default:
                print("Nothing...")
            }
            
            switch secondUnit {
            case "Gram":
                return massInGrams!
            case "Kilogram":
                return massInGrams! / 1000
            case "Milligram":
                return massInGrams! * 1000
            case "Microgram":
                return massInGrams! * pow(10, 6)
            case "Ounce":
                return massInGrams! / 28.35
            case "Tonne":
                return massInGrams! / pow(10, 6)
            case "Stone":
                return massInGrams! / 6350
            default:
                return -1
            }
        }
    }
    
    func convertSpeed() -> Float {
        let firstUnit = units["Speed"]![firstUnitPicker.selectedRow(inComponent: 0)]
        let secondUnit = units["Speed"]![secondUnitPicker.selectedRow(inComponent: 0)]
        
        if firstUnit == secondUnit {
            return mainNumber!
        } else {
            var speedInMPS : Float? = nil
            
            switch firstUnit {
            case "Metres per second":
                speedInMPS = mainNumber!
            case "Kilometres per hour":
                speedInMPS = mainNumber! / 3.6
            case "Miles per hour":
                speedInMPS = mainNumber! / 2.237
            case "Knot":
                speedInMPS = mainNumber! / 1.944
            default:
                print("Nothing...")
            }
            
            switch secondUnit {
            case "Metres per second":
                return speedInMPS!
            case "Kilometres per hour":
                return speedInMPS! * 3.6
            case "Miles per hour":
                return speedInMPS! * 2.237
            case "Knot":
                return speedInMPS! * 1.944
            default:
                return -1
            }
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
            case "Celsius":
                return tempInCelsius!
            case "Kelvin":
                return tempInCelsius! + 273.15
            case "Fahrenheit":
                return (tempInCelsius! * 1.8) + 32
            default:
                return -1
            }
        }
    }
    
    func convertTime() -> Float {
        let firstUnit = units["Time"]![firstUnitPicker.selectedRow(inComponent: 0)]
        let secondUnit = units["Time"]![secondUnitPicker.selectedRow(inComponent: 0)]
        
        if firstUnit == secondUnit {
            return mainNumber!
        } else {
            var timeInSeconds : Float? = nil
            
            switch firstUnit {
            case "Second":
                timeInSeconds = mainNumber!
            case "Minute":
                timeInSeconds = mainNumber! * 60
            case "Hour":
                timeInSeconds = mainNumber! * 3600
            case "Day":
                timeInSeconds = mainNumber! * 86400
            case "Week":
                timeInSeconds = mainNumber! * 604800
            case "Millisecond":
                timeInSeconds = mainNumber! / 1000
            case "Microsecond":
                timeInSeconds = mainNumber! / pow(10, 6)
            case "Nanosecond":
                timeInSeconds = mainNumber! / pow(10, 9)
            default:
                print("Nothing...")
            }
            
            switch secondUnit {
            case "Second":
                return timeInSeconds!
            case "Minute":
                return timeInSeconds! / 60
            case "Hour":
                return timeInSeconds! / 3600
            case "Day":
                return timeInSeconds! / 86400
            case "Week":
                return timeInSeconds! / 604800
            case "Millisecond":
                return timeInSeconds! * 1000
            case "Microsecond":
                return timeInSeconds! * pow(10, 6)
            case "Nanosecond":
                return timeInSeconds! * pow(10, 9)
            default:
                return -1
            }
        }
    }
    
    func convertVolume() -> Float {
        let firstUnit = units["Volume"]![firstUnitPicker.selectedRow(inComponent: 0)]
        let secondUnit = units["Volume"]![secondUnitPicker.selectedRow(inComponent: 0)]
        
        if firstUnit == secondUnit {
            return mainNumber!
        } else {
            var volumeInLitres : Float? = nil
            
            switch firstUnit {
            case "Litre":
                volumeInLitres = mainNumber!
            case "Millilitre":
                volumeInLitres = mainNumber! / 1000
            case "Gallon":
                volumeInLitres = mainNumber! * 4.546
            case "Pint":
                volumeInLitres = mainNumber! / 1.76
            case "Cubic Metre":
                volumeInLitres = mainNumber! * 1000
            default:
                print("Nothing...")
            }
            
            switch secondUnit {
            case "Litre":
                return volumeInLitres!
            case "Millilitre":
                return volumeInLitres! * 1000
            case "Gallon":
                return volumeInLitres! / 4.546
            case "Pint":
                return volumeInLitres! * 1.76
            case "Cubic Metre":
                return volumeInLitres! / 1000
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
        } else if pickerView == firstUnitPicker || pickerView == secondUnitPicker {
            print("Changing unit...")
            if mainNumber != nil {
                mainNumber = Float(textField.text!)
                handleCategory(chosenCategory: unitCategories[categoryPicker.selectedRow(inComponent: 0)])
            }
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
