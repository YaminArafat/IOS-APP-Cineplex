//
//  Login.swift
//  MovieTickets
//
//  Created by Nazirul Hasan on 25/11/19.
//  Copyright © 2019 Nazirul Hasan. All rights reserved.
//

import UIKit
import Firebase

class Login: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func login(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: email.text!, password: pass.text!) { (user, error) in
            if (error != nil) {
                print("Login Unsuccessful")
                print(error!)
            }
            else {
                print("Login Successful")
                self.performSegue(withIdentifier: "goToMDFromLog", sender: self)
            }
        }
    }
}
