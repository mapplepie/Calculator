//
//  ViewController.swift
//  Calculator
//
//  Created by Mai Uchida on 2021/11/10.
//

import UIKit
import PixelMplus

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
   private var isFinishedTypingNumber :Bool = true
    
    private var displayValue : Double{
        get{
            guard let number = Double(displayLabel.text!)else{
                fatalError("cannot convert display label text to a Double.")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        
        if let calcMethod = sender.currentTitle{
            let calculator = CalculatorLogic(number: displayValue)
            
            guard let results = calculator.calculate(symbol: calcMethod) else{
                fatalError("the result of the calculation is nil.")
            }
            displayValue = results
            
        }
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle{
            if isFinishedTypingNumber{
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else{
                if numValue == "."{
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

