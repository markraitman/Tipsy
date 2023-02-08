//
//  ViewController.swift
//  Tipsy
//
//  Created by Марк Райтман on 07.02.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: Properties
    var result: Float = 0.00
    var resultString = ""
    var chosenPct = ""
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Outlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    //MARK: Actions
    @IBAction func tipChanged(_ sender: UIButton) {
        
        if sender == zeroPctButton{
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if sender == tenPctButton {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
        
        chosenPct = sender.currentTitle!
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        billTextField.endEditing(true)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        if zeroPctButton.isSelected == true && billTextField.text != ""{
            result = (Float(billTextField.text!)! + (Float(billTextField.text!)! * 0.00)) / Float(splitNumberLabel.text!)!
            resultString = String(format: "%.2f", result)
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
            
            print(resultString)
        } else if tenPctButton.isSelected == true && billTextField.text != ""{
            result = (Float(billTextField.text!)! + (Float(billTextField.text!)! * 0.10)) / Float(splitNumberLabel.text!)!
            resultString = String(format: "%.2f", result)
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
            
            print(resultString)
        } else if twentyPctButton.isSelected == true && billTextField.text != ""{
            result = (Float(billTextField.text!)! + (Float(billTextField.text!)! * 0.20)) / Float(splitNumberLabel.text!)!
            resultString = String(format: "%.2f", result)
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
            
            print(resultString)
        } else {
            billTextField.placeholder = "Error!"
        }
        
        
    }
    
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalValue = resultString
            destinationVC.totalAmounOfPeople = splitNumberLabel.text!
            destinationVC.totalPct = chosenPct
        }
    }

}

