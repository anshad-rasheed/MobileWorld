//
//  ViewController.swift
//  CircularSample
//
//  Created by Anshad R on 01/03/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let circularView  = CircularProgressView()
        circularView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(circularView)
        NSLayoutConstraint.activate([
            circularView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            circularView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            circularView.heightAnchor.constraint(equalToConstant: 200),
            circularView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
//        drawCircle(radius: 100, center: self.view.center)

    }
    func drawCircle(radius: CGFloat, center: CGPoint) {
           let circularShape = CAShapeLayer()
           let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
           circularShape.path = circularPath.cgPath
           circularShape.strokeColor = UIColor.gray.cgColor
           circularShape.lineWidth = 2
           circularShape.fillColor = UIColor.clear.cgColor
        self.view.layer.addSublayer(circularShape)
           
       }
   
}


