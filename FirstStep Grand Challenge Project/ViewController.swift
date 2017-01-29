//
//  ViewController.swift
//  FirstStep Grand Challenge Project
//
//  Created by zhanglong Peng on 25/01/2017.
//  Copyright © 2017 zhanglong Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var welcomeLable: UILabel!
    @IBOutlet weak var firstStepLable: UILabel!
    
    //MARK: Actions
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        print("Sign in Button Pressed")
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        print("Sign up Button Pressed")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

