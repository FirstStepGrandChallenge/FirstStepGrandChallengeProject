//
//  SignInViewController.swift
//
//
//  Created by zhanglong Peng on 30/01/2017.
//
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignInViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
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
    
    
    
    @IBAction func SignInAction(_ sender: UIButton) {
        self.email.resignFirstResponder()
        self.password.resignFirstResponder()
        
        if self.email.text == "" || self.password.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            FIRAuth.auth()?.signIn(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
                
                if error == nil {
                    
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    
                    
                    let uid = FIRAuth.auth()?.currentUser?.uid
                    FIRDatabase.database().reference().child("users").child(uid!).observe(.value, with: {(Snapshot:FIRDataSnapshot) in
                        let dataDict = Snapshot.value as? NSDictionary
                        
                        // let dataDict = Snapshot.value as? NSDictionary
                        let iden = dataDict?.object(forKey: "iden") as! Int
                        
                        print(iden)
                        if(iden == 1){
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                            self.present(vc!, animated: true, completion: nil)
                        }
                        else{
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "th")
                            self.present(vc!, animated: true, completion: nil)
                        }
                        
                        
                        
                        
                    }
                        
                        
                        
                        
                        
                        , withCancel: nil)
                    
                    
                    
                    
                    
                    
                    
                    
                    //Go to the HomeViewController if the login is sucessful
                    //                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    //                            self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
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
