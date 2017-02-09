//
//  PatientViewController.swift
//
//
//  Created by zhanglong Peng on 31/01/2017.
//
//

import UIKit

class PatientViewController: UIViewController {
    
    
    @IBOutlet weak var dateText: UITextField!
    
    @IBOutlet weak var todayButton: UIButton!
    
    @IBOutlet weak var popView: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    @IBAction func todayButtonTypped(sender: UIButton){
        //   go back to the date ....today....
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    // MARK: TextField Delegate
    /*
     func textFieldDidBeginEditing (textField: UITextField){
     let datePicker = UIDatePicker()
     textField.inputView = datePicker
     datePicker.addTarget(self, action: Selector("datePickerChanged:"), for: .valueChanged)
     }
     
     func datePickerChanged (){
     let formatter = DateFormatter()
     formatter.dateStyle = .longStyle
     
     dateText.text = formatter.stringFromDate(sender.date);
     
     }
     
     
     func textFieldShouldReturn (textField: UITextField){
     textField.resignFirstResponder()
     return true
     }*/
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let datepicker = UIDatePicker()
    
    
    func createDatePicker(){
        
        datepicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let donebutton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))
        toolbar.setItems([donebutton], animated: false)
        
        dateText.inputAccessoryView = toolbar
        
        dateText.inputView = datepicker
        
        
    }
    
    
    func donepressed(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        dateText.text = dateFormatter.string(from: datepicker.date)
        
       // dateText.text = "\(datepicker.date)"
        self.view.endEditing(true)
        
        
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
