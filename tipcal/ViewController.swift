//
//  ViewController.swift
//  tipcal
//
//  Created by linda shu on 1/11/19.
//  Copyright © 2019 linda shu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var themeView: UIView!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalField.becomeFirstResponder()
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
        let tipPercentage=[0.15,0.2,0.25]
        let bill = Double(totalField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = tip+bill
        tipLabel.text=String(format:"$%.2f",tip)
        totalLabel.text=String(format:"$%.2f",total)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tipValue=defaults.integer(forKey: "default_tip")
        tipControl.selectedSegmentIndex=tipValue
        let theme=defaults.bool(forKey: "default_theme")
        if (theme==false){
           
                UIView.animate(withDuration:0.4, animations: {
                    
                    self.themeView.backgroundColor=UIColor.gray
                })
        }
        else{
            UIView.animate(withDuration:0.4, animations: {
                
                self.themeView.backgroundColor=UIColor.white
            })
        }

        
        
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
}

