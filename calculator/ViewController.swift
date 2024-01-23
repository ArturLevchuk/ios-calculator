//
//  ViewController.swift
//  calculator
//
//  Created by Artur Levchuk on 22.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    enum Actions {
        case none, plus, minus, multiply, divide
    }
    
    var kAction = Actions.none
    var number1: Double = 0
    
    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    func insertNumber(number: String) {
        if mainTextField.text?.first == "0" {
            mainTextField.text = number
        } else {
            mainTextField.text = "\(mainTextField.text ?? "")" + number
        }
        
        
    }
    
    @IBAction func addOne(_ sender: Any) {
        insertNumber(number: "1")
    }
    
    @IBAction func addTwo(_ sender: Any) {
        insertNumber(number: "2")
    }
    
    @IBAction func addThree(_ sender: Any) {
        insertNumber(number: "3")
    }
    
    @IBAction func addFour(_ sender: Any) {
        insertNumber(number: "4")
    }
    
    @IBAction func addFive(_ sender: Any) {
        insertNumber(number: "5")
    }
    
    @IBAction func addSix(_ sender: Any) {
        insertNumber(number: "6")
    }
    
    @IBAction func addSeven(_ sender: Any) {
        insertNumber(number: "7")
    }
    
    @IBAction func addEight(_ sender: Any) {
        insertNumber(number: "8")
    }
    
    @IBAction func addNine(_ sender: Any) {
        insertNumber(number: "9")
    }
    
    @IBAction func addZero(_ sender: Any) {
        if mainTextField.text == nil || mainTextField.text!.first != "0"
        {
            insertNumber(number: "0")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        mainTextField.text = "0";
    }
    
    
    @IBAction func clear(_ sender: Any) {
        mainTextField.text = ""
    }
    
    
    @IBAction func changeSign(_ sender: Any) {
        if mainTextField.text == nil || mainTextField.text == "" || mainTextField.text?.first == "0" {
            return;
        }
        if mainTextField.text!.first == "-"
        {
            let startIndex = mainTextField.text!.index(mainTextField.text!.startIndex, offsetBy: 1)
            mainTextField.text = String(mainTextField.text!.suffix(from: startIndex))
        } else {
            mainTextField.text = "-" + mainTextField.text!
        }
    }
    
    @IBAction func getProcent(_ sender: Any) {
        if mainTextField.text == nil || mainTextField.text == "" || mainTextField.text?.first == "-"{
            return
        }
        var number = Double(mainTextField.text!)!
        number = number / 100
        mainTextField.text = String(number)
        
    }
    
    
    @IBAction func add(_ sender: Any) {
        if (secondTextField.text != "") {
            return
        }
        
        number1 = Double(mainTextField.text!)!
        
        secondTextField.text = mainTextField.text! + " + "
        
        mainTextField.text = ""
        
        kAction = Actions.plus
        
        
    }
    
    @IBAction func minus(_ sender: Any) {
        if (secondTextField.text == "") {
            mainTextField.text = "-"
        } else {
            number1 = Double(mainTextField.text!)!
            
            secondTextField.text = mainTextField.text! + " - "
            
            mainTextField.text = ""
            
            kAction = Actions.minus
        }
        

    }
    
    
    @IBAction func multiply(_ sender: Any) {
        if (secondTextField.text != "") {
            return
        }
        
        number1 = Double(mainTextField.text!)!
        
        secondTextField.text = mainTextField.text! + " x "
        
        mainTextField.text = ""
        
        kAction = Actions.multiply
    }
    
    
    @IBAction func divide(_ sender: Any) {
        if (secondTextField.text != "" || mainTextField.text?.first == "0") {
            return
        }
        
        number1 = Double(mainTextField.text!)!
        
        secondTextField.text = mainTextField.text! + " / "
        
        mainTextField.text = ""
        
        kAction = Actions.divide
    }
    
    @IBAction func getResult(_ sender: Any) {
        if kAction == Actions.none || mainTextField.text == "" {
            return
        }
        
        switch kAction {
        case Actions.plus:
            let number2 = Double(mainTextField.text!)!
            let result = number1 + number2
            mainTextField.text = String(result)
            secondTextField.text = ""
            kAction = Actions.none;
        case Actions.minus:
            let number2 = Double(mainTextField.text!)!
            let result = number1 - number2
            mainTextField.text = String(result)
            secondTextField.text = ""
            kAction = Actions.none;
        case Actions.multiply:
            let number2 = Double(mainTextField.text!)!
            let result = number1 * number2
            mainTextField.text = String(result)
            secondTextField.text = ""
            kAction = Actions.none;
        case Actions.divide:
            let number2 = Double(mainTextField.text!)!
            let result = number1 / number2
            mainTextField.text = String(result)
            secondTextField.text = ""
            kAction = Actions.none;
        default:
            mainTextField.text = "0"
            secondTextField.text = ""
            kAction = Actions.none;
        }
        
    }
    
    
}
