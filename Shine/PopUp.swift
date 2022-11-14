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
