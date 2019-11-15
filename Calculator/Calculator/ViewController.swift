//
//  ViewController.swift
//  Calculator
//
//  Created by Apple on 15/11/19.
//  Copyright © 2019 KARTLA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var previousNumber : Double = 0
    var numberOnScreen : Double = 0
    var operation = 0
    var isPerformingOperation = false
    var flag = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = ""
    }

    @IBAction func numberPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        if isPerformingOperation == true{
            isPerformingOperation = false
            resultLabel.text = String(tag)
            if tag == 10{
                resultLabel.text = resultLabel.text! + "."
                numberOnScreen = Double(resultLabel.text!)!
            }else{
                numberOnScreen = Double(resultLabel.text!)!
            }
        }else{
            if tag == 10{
                resultLabel.text = resultLabel.text! + "."
                numberOnScreen = Double(resultLabel.text!)!
            }else{
                resultLabel.text = resultLabel.text! + String(tag)
                numberOnScreen = Double(resultLabel.text!)!
            }
        }
    }
    @IBAction func operatorPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        if tag == 16{
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            return
        }
        else if tag == 11{
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "/"
            operation = tag
        }else if tag == 12{
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "*"
            operation = tag
        }else if tag == 13{
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "-"
            operation = tag
        }else if tag == 14{
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "+"
            operation = tag
        }else if tag == 17{
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = String(previousNumber / Double(100))
        }else if tag == 18{
//            previousNumber = (-1) * Double(resultLabel.text!)!
            if flag == 1{
                previousNumber = (-1) * Double(resultLabel.text!)!
                resultLabel.text = String(previousNumber)
                flag = 0
            }
            if flag == 0{
//                resultLabel.text = String(previousNumber)
                  previousNumber = Double(resultLabel.text!)!
                  resultLabel.text = String(previousNumber)
                  flag = 1
            }
        }else if tag == 15{
            if operation == 11{
                resultLabel.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 12{
                resultLabel.text = String(numberOnScreen * previousNumber)
            }else if operation == 13{
                resultLabel.text = String(numberOnScreen - previousNumber)
            }else if operation == 14{
                resultLabel.text = String(numberOnScreen + previousNumber)
            }
        }
    }
}

