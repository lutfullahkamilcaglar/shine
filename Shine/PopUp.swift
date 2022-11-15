//
//  PopUp.swift
//  Shine
//
//  Created by Kamil Caglar on 12/11/2022.
//

import UIKit


class PopUp: UIView {
    
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var shareTextView: UITextView!

    @IBOutlet weak var shareButton: UIButton!
    
    func getCurrentViewController() -> UIViewController? {

       if let rootController = UIApplication.shared.keyWindow?.rootViewController {
           var currentController: UIViewController! = rootController
           while( currentController.presentedViewController != nil ) {
               currentController = currentController.presentedViewController
           }
           return currentController
       }
       return nil

   }
    
    @IBAction func shareSelectedQuote(_ sender: Any){
        let shareSheetVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
        getCurrentViewController()?.present(shareSheetVC, animated: true)
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    }
    
    func xibSetup(frame: CGRect){
        let view = loadXib()
        view.frame = frame
        addSubview(view)
    }
    
    func updateTextView(getAdvice: String) {
        shareTextView.text = getAdvice
    }
    
    func loadXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PopUp", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view!
    }
    
}
