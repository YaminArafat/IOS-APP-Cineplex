//
//  ViewController.swift
//  MovieTickets
//
//  Created by Nazirul Hasan on 25/11/19.
//  Copyright © 2019 Nazirul Hasan. All rights reserved.
//

import UIKit

class MovieDescription: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func bookTicketButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "goToBookTicket", sender: self)
    }
    
}

