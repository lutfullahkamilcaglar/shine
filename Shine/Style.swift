//
//  Style.swift
//  Shine
//
//  Created by Kamil Caglar on 12/11/2022.
//

import Foundation
import UIKit

class buttonStyle: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var boarderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = boarderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}

class imageSytle: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var boarderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = boarderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}

class viewStyle: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var boarderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = boarderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}
