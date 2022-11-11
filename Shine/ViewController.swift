//
//  ViewController.swift
//  Shine
//
//  Created by Kamil Caglar on 09/11/2022.
//

import UIKit



class ViewController: UIViewController {
    
    var networking = Networking()
    
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var adviceTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
   
    @IBAction func favButton(_ sender: Any) {
        
        
        favButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        
        
    }

    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        print("Search pressed")
    }
    
    
    @IBAction func executeRequest(_ sender: Any){
        
        
        networking.executeJson() { (json, error) in
            if let error = error {
                print(error)
            }
            print(json?.advice as Any)
            self.adviceTextView.text = json?.advice.description
            
        }
    }
    
    
    
}
