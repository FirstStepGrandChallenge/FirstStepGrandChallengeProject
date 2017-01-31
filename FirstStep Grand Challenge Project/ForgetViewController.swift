//
//  ForgetViewController.swift
//  FirstStep Grand Challenge Project
//
//  Created by zhanglong Peng on 31/01/2017.
//  Copyright © 2017 zhanglong Peng. All rights reserved.
//

import UIKit
import FirebaseAuth
class ForgetViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ResetSubmitAction(_ sender: Any) {
    
        if self.email.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            FIRAuth.auth()?.sendPasswordReset(withEmail: self.email.text!, completion: {
                (error) in
                var title = ""
                var message = ""
                if error != nil{
                    title = "oops"
                    message = (error?.localizedDescription)!
                }
                else{
                    title = "Success!"
                    message = "Password reset email sent"
                    self.email.text = ""
                }
                
                
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
                
                
                
            })
        }
        
        
        
        
        
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
