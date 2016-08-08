//
//  ViewController.swift
//  TipTip
//
//  Created by Chase McElroy on 8/8/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipSegmentedControll: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipTitleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tipTitleLabel.text = NSLocalizedString("MainPage.TipTitleLabel", comment: "This is the Label talking about the tip")
    }

    @IBAction func textFieldChanged(sender: AnyObject) {
        calculateTotal()
    }

    @IBAction func valueChanged(sender: UISegmentedControl) {
        calculateTotal()
    }
    
    func calculateTotal() {
        if let bill : Double = Double(self.billTextField.text!) {
            var tipPercentage : Double
            
            if self.tipSegmentedControll.selectedSegmentIndex == 0 {
                tipPercentage = 0.10
            }
            if self.tipSegmentedControll.selectedSegmentIndex == 1 {
                tipPercentage = 0.15
            } else {
                tipPercentage = 0.20
            }
            
            let tip = bill * tipPercentage
            let total = tip + bill
            
            self.tipLabel.text = "$\(tip)"
            self.totalLabel.text = "$\(total)"
        }
    }
}

