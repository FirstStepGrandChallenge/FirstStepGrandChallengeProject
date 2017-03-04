//
//  RegistrationInforViewController.swift
//  FirstStep Grand Challenge Project
//
//  Created by Jessica Chen on 3/3/17.
//  Copyright © 2017 zhanglong Peng. All rights reserved.
//

import UIKit

class RegistrationInforViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var genderInput: UITextField!
    @IBOutlet weak var genderPicker: UIPickerView!
    
    var Array = ["Female", "Male", "Other"]
    var placementInput = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        genderPicker.delegate = self;
        genderPicker.dataSource = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Array.count
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBAction func submit(_ sender: Any) {
        if (placementInput == 0) {
            genderInput.text = "Female"
        }
            
        else if (placementInput == 1) {
            genderInput.text = "Male"
        }
            
        else {
            genderInput.text = "Other"
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placementInput = row
    }
    
}

