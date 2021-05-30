//
//  ViewController.swift
//  calculTest
//
//  Created by Ash on 29.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var display: UILabel!
    var stillTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    var currentInput: Double {
        get {
            return Double(display.text!)!
        }
        set{
//            if newValue != .infinity {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                display.text = "\(valueArray[0])"
            } else {
                display.text = "\(newValue)"
            }
            stillTyping = false
//            } else {
//                print("err")
//                allert()
//            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle
//        display.text = number
        if stillTyping {
            if (display.text?.utf8CString.count)! < 20 {
                display.text = display.text! + number!
        }
        } else {
            display.text = number
            stillTyping = true
        }
    }
    
//    func operateWithTwoOperands (operation: (Double, Double) -> Double) {
//        currentInput = operation(firstOperand, secondOperand)
//
//    }
    
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        guard let sign = sender.currentTitle else{return}
        operationSign = sign
//        guard currentInput != .infinity else {return}
    firstOperand = currentInput
    stillTyping = false
  
    }

    func addCulc(first: Double, second: Double) -> Double {
        return first + second
    }
    
    func substract(first: Double, second: Double) -> Double {
        return first - second
    }
    
    func multiply(first: Double, second: Double) -> Double {
        return first * second
    }

    func divide(first: Double, second: Double) -> Double {
        if second != 0.0 {
            return first / second
           
        } else{
            allert()
            operationSign = ""
            return first
            
        }
    }

    @IBAction func equalitySignPressed(_ sender: UIButton) {
        if stillTyping{
            secondOperand = currentInput
        }
        
        switch operationSign {
        case "+":
            currentInput = addCulc(first: firstOperand, second: secondOperand)
//            operateWithTwoOperands{$0 + $1}
        case "-":
           currentInput = substract(first: firstOperand, second: secondOperand)
//            operateWithTwoOperands{$0 - $1}
        case "x":
           currentInput = multiply(first: firstOperand, second: secondOperand)
//            operateWithTwoOperands{$0 * $1}
        case "÷":
            currentInput = divide(first: firstOperand, second: secondOperand)
//            operateWithTwoOperands{$0 / $1}
        default: break
            
        }
        
    }
    @IBAction func clearButton(_ sender: Any) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        display.text = "0"
        stillTyping = false
        operationSign = ""
    }
    
    

}

extension ViewController {
    func allert(){
        let allert = UIAlertController(title: "Uuups!", message: "Делить на нуль не стоит!)", preferredStyle: .alert)
        allert.addAction(UIAlertAction(title: "Okay...", style: .default, handler: nil))
        self.present(allert, animated: true)
    
    }
}

