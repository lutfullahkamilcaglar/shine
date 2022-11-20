//
//  ViewController.swift
//  Shine
//
//  Created by Kamil Caglar on 09/11/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = Networking()
    
    var popUpShare = PopUp()
    
    var sharePopUp: PopUp!
    var adviceText = ""
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var adviceTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.addTarget(self, action: #selector(self.animateButton(sender:)), for: .touchUpInside)
        self.shareButton.layer.cornerRadius = 20
    }
    
    
    @IBAction func shareButton(_ sender: Any) {
        self.sharePopUp = PopUp(frame: self.view.frame)
        self.sharePopUp.exitButton.addTarget(self, action: #selector(closeExitButton), for: .touchUpInside)
        self.view.addSubview(sharePopUp)
        self.sharePopUp.updateTextView(getAdvice: adviceText)
    }
    
    @objc func closeExitButton() {
        self.sharePopUp.removeFromSuperview()
    }
    
    @IBAction func onClickSearchButton(_ sender: UIButton) {
        if let searchInput = searchTextField.text {
            networkManager.adviceRequest(query: searchInput) { (res, error) in
                if let error = error {
                    print(error)
                    return
                }
                
                var searchAdviceText: String = ""
                let adviceList: [String] = res?.slips.map { slip in
                    slip.advice
                } ?? []
                for (index, item) in adviceList.enumerated() {
                    if (index == 0) {
                        searchAdviceText.append("Advice: " + item.description)
                    } else {
                        searchAdviceText.append("\nAdvice: " + item.description)
                    }
                }
                self.adviceText = searchAdviceText
                self.adviceTextView.text = self.adviceText
            }
        }
    }
    
    @IBAction func onClickNextButtonPressed(_ sender: Any){
        networkManager.executeJson() { (res, error) in
            if let error = error {
                print(error)
            }
            let advice = (res?.advice.description)!
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
