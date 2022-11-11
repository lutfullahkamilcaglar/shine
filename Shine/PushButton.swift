//
//  PushButton.swift
//  Shine
//
//  Created by Kamil Caglar on 11/11/2022.
//

import UIKit

class PushButton: UIButton {
    
    var path: UIBezierPath!
     
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.backgroundColor = UIColor.darkGray
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createRectangle(_ rect: CGRect) {
        path = UIBezierPath()
        
    }

    override func draw(_ rect: CGRect) {
        //self.createRectangle(rect)
//        let path = UIBezierPath(ovalIn: rect)
//        UIColor.black.setFill()
//          path.fill()
        self.createTriangle()
         
            // Specify the fill color and apply it to the path.
            UIColor.gray.setFill()
            path.fill()
         
            // Specify a border (stroke) color.
            UIColor.black.setStroke()
            path.stroke()
           
    }
    func createTriangle() {
        path = UIBezierPath() 
        
        
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width, y:self.frame.size.height/2))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.close()
    }
    
   

}
