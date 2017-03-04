//
//  SignUpViewController.swift
//  FirstStep Grand Challenge Project
//
//  Created by zhanglong Peng on 30/01/2017.
//  Copyright © 2017 zhanglong Peng. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var password2: UITextField!
    
    
    @IBOutlet weak var TherButt: UIButton!
    @IBOutlet weak var PatiButt: UIButton!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var Gender: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    
    
    let databaseRef = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    @IBAction func SignUp(_ sender: Any) {
        self.email.resignFirstResponder()
        self.password1.resignFirstResponder()
        self.password2.resignFirstResponder()
        
        if email.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            if password1.text == password2.text{
                FIRAuth.auth()?.createUser(withEmail: email.text!, password: password1.text!) { (user, error) in
                    
                    
                    
                    
                    if error == nil {
                        
                        
                        guard let uid = user?.uid else{
                            return
                        }
                        
                        let values = ["email": self.email.text!]
                        let userRef = self.databaseRef.child("users").child(uid)
                        userRef.updateChildValues(values, withCompletionBlock: {
                            (err, databaseRef) in
                            
                            if err != nil {
                                print("save fail")
                                return
                            }
                            print("save successful")
                        })
                        userRef.child("iden").setValue(1)
                        
                        
                        print("You have successfully signed up")
                        //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                        
                        //let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                        //self.present(vc!, animated: true, completion: nil)
                        
                    } else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
            else{
                let alertController = UIAlertController(title: "Error", message: "password doesnt match", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)
            }
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
