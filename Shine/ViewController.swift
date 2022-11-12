//
//  ViewController.swift
//  Shine
//
//  Created by Kamil Caglar on 09/11/2022.
//

import UIKit



class ViewController: UIViewController {
    
    var networking = Networking()
    var popUpShare = PopUp()
    
    var sharePopUp: PopUp!
    
    var adviceText: String = ""
    
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var adviceTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let largeConfiguration = UIImage.SymbolConfiguration(pointSize: 35, weight: .bold, scale: .large)
//
//        favButton.setImage(UIImage(systemName: "star", withConfiguration: largeConfiguration), for: .normal)
        nextButton.addTarget(self, action: #selector(self.animateButton(sender:)), for: .touchUpInside)
        self.shareButton.layer.cornerRadius = 20
        self.adviceTextView.text = adviceText
    }
    
    
    @IBAction func shareButton(_ sender: Any) {
        self.sharePopUp = PopUp(frame: self.view.frame)
        self.sharePopUp.exitButton.addTarget(self, action: #selector(closeExitButton), for: .touchUpInside)
        self.view.addSubview(sharePopUp)
        
        
    }
    
    @objc func closeExitButton() {
        self.sharePopUp.removeFromSuperview()
    }
    
    var checkFavorite: Bool = false
    @IBAction func favButton(_ sender: Any) {
                
        
//        let largeConfiguration = UIImage.SymbolConfiguration(pointSize: 35, weight: .bold, scale: .large)
        
        if checkFavorite == true {
            favButton.setImage(UIImage(systemName: "star"), for: .normal)
            checkFavorite = false
            
        } else if checkFavorite == false {
            favButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            checkFavorite = true
        }
        
        
        
        
//        if ((favButton.currentImage?.isEqual(UIImage(systemName: "star"))) != nil){
//            favButton.setImage(UIImage(systemName: "star.fill", withConfiguration: largeConfiguration), for: .normal)
//            print("Currentimage.")
//        }
        //favButton.setImage(UIImage(systemName: "star.fill", withConfiguration: largeConfiguration), for: .normal)
        
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
       

    }
 
    
    @IBAction func executeRequest(_ sender: Any){
        //nextButton action
        networking.executeJson() { (json, error) in
            if let error = error {
                print(error)
                return
            }
            let advice = (json?.advice.description)!
            self.adviceText = advice
            self.adviceTextView.text = self.adviceText
        }
    }
    
    @objc fileprivate func animateButton(sender: UIButton){
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
