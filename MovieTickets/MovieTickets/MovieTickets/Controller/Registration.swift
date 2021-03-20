//
//  Registration.swift
//  MovieTickets
//
//  Created by Nazirul Hasan on 25/11/19.
//  Copyright © 2019 Nazirul Hasan. All rights reserved.
//

import UIKit
import Firebase

class Registration: UIViewController {

    @IBOutlet weak var uname: UITextField!
    @IBOutlet weak var uemail: UITextField!
    @IBOutlet weak var upass: UITextField!
    @IBOutlet weak var ucpass: UITextField!
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
    @IBAction func register(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: uemail.text!, password: upass.text!) { (user, error) in
            if (error != nil) {
                print(error!)
            }
            else {
                print("Registration Successful!!!")
                self.performSegue(withIdentifier: "goToMDFromReg", sender: self)
            }
        }
    }
    
    @IBAction func habijabi(_ sender: Any) {
        performSegue(withIdentifier: "xyz", sender: self)
    }
    
}
