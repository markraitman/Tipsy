//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Марк Райтман on 07.02.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //MARK: - Properties
    var totalValue: String?
    var totalAmounOfPeople: String = ""
    var totalPct: String = ""
    
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalValue
        settingsLabel.text = "Split between \(totalAmounOfPeople) people, with \(totalPct) tip"
    }
    
    //MARK: - Outlets
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    //MARK: - Actions
    @IBAction func recalclulatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
