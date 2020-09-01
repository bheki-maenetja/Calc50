# Calc50 (iOS Mobile Application)
Calc50 is a mobile iOS calculator application built with Swift and Xcode. The application allows users to do simple and complex arithmetic calculations as well as unit conversion and calculations involving time and date.
## Getting Started
### Installation
- Clone this repository by running the terminal command `git clone git@github.com:bheki-maenetja/Calc50.git`
- Open the file `Calc50.xcodeproj` (you will need to install Xcode if you haven't already)
- To run the application click the play button in the top left hand side of your Xcode window

## Technologies Used
- Swift 5
- Xcode 10
- UIKit

## Overview
Calc50 is a mobile iOS calculator application built with Swift and Xcode. The application allows users to do simple and complex arithmetic calculations as well as unit conversion and calculations involving time and date. The app is comprised of four calculators: a simple arithmetic calculator, a calculator for more complex operations such as logarithmic and trigonometric functions, a unit converter and a calculator for calculating the time between two different dates.

### Simple Calculator
- The simple calculator works much the same way as any other mobile calculator app. Users can perform simple calculations involving addition, subtraction, multiplication and division. Users can also work with percentages.

### Advanced Calculator
- The advanced calculator works by first asking the user to first enter a number through a native keyboard provided by iOS. The user can then apply a multitude a mathematical functions including those related to trigonometry, logarithms, exponents and surds.

### Unit Converter
- The unit converter allows users to convert units of area, energy, length, mass, speed, temperature, time and volume. The user uses a series of UIPickerViews to select the category of units, the unit to be converted from and the unit to be converted to. The user will then enter an integer value to convert from the first unit to the second unit.

### Date Calculator
- The date calculator allows to calculate the time between any two calendar dates. This time can be expressed in different units such as seconds, days, weeks and hours.

## Development
### Navigation
- Each calculator has its own view controller and each view controller is nested in a tab bar controller. The allows for the easy navigation between different calculators and the home page. Additionally, on the home page are four buttons that take the user to one of the four calculators. Rather than using segues, to implement the functionality of the buttons I used an `@IBAction` function that changes the `selectedIndex` property of the parent tab bar controller
```
@IBAction func simpleCalcSegue(_ sender: UIButton) {
      switch String(sender.title(for: .normal)!) {
        case "Simple Calculator":
            self.tabBarController?.selectedIndex = 1
        case "Advanced Calculator":
            self.tabBarController?.selectedIndex = 2
        case "Date Calculator":
            self.tabBarController?.selectedIndex = 3
        case "Unit Converter":
            self.tabBarController?.selectedIndex = 4
        default:
            print("Nothing...")
      }
}
```
### Switch Statements
- Switch statements feature heavily in the source of this app. On the simple calculator they are used to discern the symbol of the button that the user has just tapped; they're also used to determine what calculation should be performed if the symbol is an operator symbol. Switch statements on the advanced calculator have a similar purpose to those on the simple calculator. On the unit converter switch statments are used to implement the functionality of the UIPickerViews. The function handleCategory uses a switch statement to determine which conversion function to call, this depends on the name of the selected unit category. On the date calculator a switch statement is used to determine which unit of time in which to express the interval between the two chosen dates.
```
func calculateDateInterval(category : String) -> Int {
        switch category {
        case "seconds":
            let timeInterval = Calendar.current.dateComponents([.second], from: firstDatePicker.date, to: secondDatePicker.date)
            return Int(timeInterval.second!)
        case "minutes":
            let timeInterval = Calendar.current.dateComponents([.minute], from: firstDatePicker.date, to: secondDatePicker.date)
            return Int(timeInterval.minute!)
        case "hours":
            let timeInterval = Calendar.current.dateComponents([.hour], from: firstDatePicker.date, to: secondDatePicker.date)
            return Int(timeInterval.hour!)
        case "days":
            let timeInterval = Calendar.current.dateComponents([.day], from: firstDatePicker.date, to: secondDatePicker.date)
            return Int(timeInterval.day!)
        case "months":
            let timeInterval = Calendar.current.dateComponents([.month], from: firstDatePicker.date, to: secondDatePicker.date)
            return Int(timeInterval.month!)
        case "years":
            let timeInterval = Calendar.current.dateComponents([.year], from: firstDatePicker.date, to: secondDatePicker.date)
            return Int(timeInterval.year!)
        default:
            return -1
        }
}
```