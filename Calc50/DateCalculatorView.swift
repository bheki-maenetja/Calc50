//
//  DateCalculatorView.swift
//  Calc50
//
//  Created by Bheki Maenetja on 2020/08/07.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class DateCalculatorView: UIViewController {

    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var firstDatePicker: UIDatePicker!
    @IBOutlet weak var secondDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
