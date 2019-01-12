//
//  SettingsViewController.swift
//  tipcal
//
//  Created by linda shu on 1/11/19.
//  Copyright © 2019 linda shu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet var themeView: UIView!
   

    @IBOutlet weak var themeSwitch: UISwitch!
    
    @IBOutlet weak var defaultControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let tipValue=defaults.integer(forKey: "default_tip")
        defaultControl.selectedSegmentIndex=tipValue
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

            
    
        themeSwitch.setOn(theme, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDefault(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        // Set a String value for some key.
        defaults.set(defaultControl.selectedSegmentIndex, forKey: "default_tip")
        defaults.synchronize()
    }

    @IBAction func changeTheme(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(themeSwitch.isOn, forKey: "default_theme")
        defaults.synchronize()

        if (themeSwitch.isOn==false){
        UIView.animate(withDuration:0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.themeView.backgroundColor=UIColor.gray
        })}
        else{
            UIView.animate(withDuration:0.4, animations: {
                
                self.themeView.backgroundColor=UIColor.white
            })
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
