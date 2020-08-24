//
//  DateCalculatorView.swift
//  Calc50
//
//  Created by Bheki Maenetja on 2020/08/07.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class DateCalculatorView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var firstDatePicker: UIDatePicker!
    @IBOutlet weak var secondDatePicker: UIDatePicker!
    
    var pickerViewData: [String] = ["seconds", "minutes", "hours", "days", "months", "years"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        secondDatePicker.minimumDate = firstDatePicker.date
        // Do any additional setup after loading the view.
    }
    
    @IBAction func firstDateAction(_ sender: UIDatePicker) {
        secondDatePicker.minimumDate = firstDatePicker.date
        calculateDateInterval()
    }
    
    @IBAction func secondDateAction(_ sender: UIDatePicker) {
        calculateDateInterval()
    }
    
    func calculateDateInterval() {
        let timeInterval = Calendar.current.dateComponents([.second], from: firstDatePicker.date, to: secondDatePicker.date)
        print("Seconds:", Int(timeInterval.second!))
//        print("Minutes:", timeInterval.minute)
//        print("Hours:", timeInterval.hour)
//        print("Days:", timeInterval.day)
//        print("Months:", timeInterval.month)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
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
