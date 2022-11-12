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
        let largeConfiguration = UIImage.SymbolConfiguration(pointSize: 35, weight: .bold, scale: .large)
        
        favButton.setImage(UIImage(systemName: "star", withConfiguration: largeConfiguration), for: .normal)
        
        nextButton.addTarget(self, action: #selector(self.animateButton(sender:)), for: .touchUpInside)
        

    }
   
    @IBAction func favButton(_ sender: Any) {
        
        let largeConfiguration = UIImage.SymbolConfiguration(pointSize: 35, weight: .bold, scale: .large)
        
        favButton.setImage(UIImage(systemName: "star.fill", withConfiguration: largeConfiguration), for: .normal)
        
        
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
    
    @objc fileprivate func animateButton(sender: UIButton){
        print("Animated")
        self.animateView(sender)
    }
    
    fileprivate func animateView(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 15, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)},completion: nil)
        }
    }
}
