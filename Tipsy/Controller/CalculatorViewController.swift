//
//  ViewController.swift
//  Tipsy
//
//  Created by Марк Райтман on 07.02.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
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
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        if zeroPctButton.isSelected == true{
            print(0.0)
        } else if tenPctButton.isSelected == true{
            print(0.1)
        } else {
            print(0.2)
        }
        
        print(splitNumberLabel.text!)
    }
    

}

