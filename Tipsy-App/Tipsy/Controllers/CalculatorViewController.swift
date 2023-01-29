//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!

    var tip = 0.10
    var split = 2
    var totalBill = 0.0
    var resultTo2Decimal: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }

    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleDropLast = String(buttonTitle.dropLast())
        
        let buttonTitleNum = Double(buttonTitleDropLast)!
        
        tip = buttonTitleNum / 100
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let splitTitle = Int(sender.value).description
        splitNumberLabel.text = splitTitle
        split = Int(splitTitle)!
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var bill = billTextField.text!
        
        bill = bill.description.replacingOccurrences(of: ",", with: ".")
        
        if bill != "" {
            
            totalBill = Double(bill)!
            
            let result = totalBill * (1 + tip) / Double(split)
            
            resultTo2Decimal = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculatedResult = resultTo2Decimal
            destinationVC.numberOfPeople = split
            destinationVC.tipPercentage = Int(tip * 100)
            
        }
    }
}

