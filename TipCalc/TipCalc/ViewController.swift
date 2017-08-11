//
//  ViewController.swift
//  TipCalc
//
//  Created by Erin Morrissey on 8/8/17.
//  Copyright © 2017 Erin Morrissey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    let tipPercentages = [0.15, 0.2, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if defaults.string(forKey: "tip") == "0.15" {
            tipControl.selectedSegmentIndex = 0
        } else if defaults.string(forKey: "tip") == "0.2" {
            tipControl.selectedSegmentIndex = 1
        } else if defaults.string(forKey: "tip") == "0.25" {
            tipControl.selectedSegmentIndex = 2
        } else {
            tipControl.selectedSegmentIndex = -1
        }
        
    }

}

