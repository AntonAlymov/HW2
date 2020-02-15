//
//  ViewController.swift
//  HW2
//
//  Created by Антон Алымов on 12.02.2020.
//  Copyright © 2020 Anton Alymov Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0

    let alertWrongFormat = UIAlertController(title: "Wrong format", message: "Please enter a numerical value from 0 to 1", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)

    
    @IBOutlet var viewColor: UIView!

    @IBOutlet var labelRed: UILabel!
    @IBOutlet var labelGreen: UILabel!
    @IBOutlet var labelBlue: UILabel!
    
    @IBOutlet var sliderColorRed: UISlider!
    @IBOutlet var sliderColorGreen: UISlider!
    @IBOutlet var sliderColorBlue: UISlider!
    
    @IBOutlet var textFieldRed: UITextField!
    @IBOutlet var textFieldGreen: UITextField!
    @IBOutlet var textFieldBlue: UITextField!

    @IBOutlet var doneButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = viewColor.frame.width/20
        
        sliderColorRed.value = 0
        sliderColorRed.minimumValue = 0
        sliderColorRed.maximumValue = 1
        sliderColorRed.minimumTrackTintColor = .red
        sliderColorRed.maximumTrackTintColor = .white
        
        sliderColorGreen.value = 0
        sliderColorGreen.minimumValue = 0
        sliderColorGreen.maximumValue = 1
        sliderColorGreen.minimumTrackTintColor = .green
        sliderColorGreen.maximumTrackTintColor = .white
        
        sliderColorBlue.value = 0
        sliderColorBlue.minimumValue = 0
        sliderColorBlue.maximumValue = 1
        sliderColorBlue.minimumTrackTintColor = .blue
        sliderColorBlue.maximumTrackTintColor = .white


        doneButton.isHidden = true

    }

    func refreshViewColorBackground() {
        viewColor.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
    }

    func showAlertWrongFormat(textField: UITextField! ) {
        alertWrongFormat.addAction(okAction)
        present(alertWrongFormat, animated: true, completion: nil)
        textField.text = nil
    }

    func checkingCorrectValue ( color: CGFloat, sliderColor: UISlider!, textField: UITextField!) {
        if textField.text?.isEmpty == false {
            if let newValue = Float(textField.text!) {
                if newValue >= 0 && newValue <= 1 {
                    sliderColor.setValue(newValue, animated: true)
                    switch color {
                        case red:
                            red = CGFloat(newValue)

                        case green:
                            green = CGFloat(newValue)

                        case blue:
                            blue = CGFloat(newValue)

                        default: break
                    }
                } else {
                    showAlertWrongFormat(textField: textField)
                }
            } else {
                showAlertWrongFormat(textField: textField)
            }
        } else {
            showAlertWrongFormat(textField: textField)
        }

    }
    
    @IBAction func sliderActionRed () {
        red = CGFloat(sliderColorRed.value)
        refreshViewColorBackground()
        textFieldRed.text = NSString(format: "%.2f", CGFloat(red)) as String
    }
    
    @IBAction func sliderActionGreen () {
        green = CGFloat(sliderColorGreen.value)
        refreshViewColorBackground()
        textFieldGreen.text = NSString(format: "%.2f", green) as String
    }
    
    @IBAction func sliderActionBlue () {
        blue = CGFloat(sliderColorBlue.value)
        refreshViewColorBackground()
        textFieldBlue.text = NSString(format: "%.2f", blue) as String
    }

    
    @IBAction func donePresseg(_ sender: Any) {
        checkingCorrectValue(color: red, sliderColor: sliderColorRed, textField: textFieldRed)
        checkingCorrectValue(color: green, sliderColor: sliderColorGreen, textField: textFieldGreen)
        checkingCorrectValue(color: blue, sliderColor: sliderColorBlue, textField: textFieldBlue)
        viewColor.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
        doneButton.isHidden = true

    }

    @IBAction func EditTextFieldRed(_ sender: Any) {
        doneButton.isHidden = false
    }

//    @IBAction func EditTextFieldRed(_ sender: Any) {
//        doneButton.isHidden = false
//}
//
//
//    @IBAction func EditTextFieldGreen(_ sender: Any) {
//        doneButton.isHidden = false
//    }
//
//    @IBAction func EditTextFieldBlue(_ sender: Any) {
//        doneButton.isHidden = false
//    }

}


