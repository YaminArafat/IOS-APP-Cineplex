//
//  ViewController.swift
//  MovieTicketsAdmin
//
//  Created by Nazirul Hasan on 2/12/19.
//  Copyright © 2019 Nazirul Hasan. All rights reserved.
//

import UIKit
import Firebase
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    let apiKey = "3a89fb4c"
    
    var directorName = ""
    var genre = ""
    var plot = ""
    var imdbRating = ""
    var movieName = ""
    
    @IBOutlet weak var mname: UITextField!
    @IBOutlet weak var tname: UITextField!
    @IBOutlet weak var mtime: UITextField!
    @IBOutlet weak var pPrice: UITextField!
    @IBOutlet weak var rPrice: UITextField!
    @IBOutlet weak var tAvailable: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonDidPress(_ sender: Any) {
        
        //fetchImage()
        
        getDataFromAPIandUploadToDatabase()
        
        //Adding To Firebase
        
        
        
        
        
        
    }
    
    /*func fetchImage(){
        let url = URL(string: mURL.text!)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.obj.movieImageView?.image = UIImage(data: data!)
            }
        }
        
    }*/
    
    func getDataFromAPIandUploadToDatabase(){
        
        let url = URL(string:"http://www.omdbapi.com/?apikey=3a89fb4c&t=\(mname.text!)")
        Alamofire.request(url!, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                let movieJSON : JSON = JSON(response.result.value!)
                
                //Parsing data
                self.directorName = movieJSON["Director"].string!
                print(movieJSON["Director"].string!)
                self.plot = movieJSON["Plot"].string!
                self.genre = movieJSON["Genre"].string!
                self.imdbRating = movieJSON["imdbRating"].string!
                self.movieName = movieJSON["Title"].string!
                let ref = Database.database().reference()
                let dataUploader = ["Movie Name":self.movieName, "Director Name":self.directorName, "Genre":self.genre, "Plot":self.plot, "IMDB Rating":self.imdbRating, "Theatre":self.tname.text!, "Time":self.mtime.text!, "Premium Price":self.pPrice.text!,"Regular Price":self.rPrice.text!, "Tickets Available":self.tAvailable.text!]
                ref.child("Admin").childByAutoId().setValue(dataUploader)
                
            }
            else {
                print("Data parsing unsuccessful")
            }
        }
    }
    
}

