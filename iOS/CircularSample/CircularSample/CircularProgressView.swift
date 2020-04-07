//
//  CircularProgressView.swift
//  CircularSample
//
//  Created by Anshad R on 01/03/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import Foundation
import UIKit

class CircularProgressView: UIView {
    let centerImageView: UIImageView = UIImageView()
    
    public init() {
        super.init(frame: .zero)
        setUp()
    }
    
    override func draw(_ rect: CGRect) {
        let radius = rect.height / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.drawCircle(radius: 80, center: self.center)
    }
    
    func setUp(){
//        backgroundColor = UIColor.cyan
        centerImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(centerImageView)
        NSLayoutConstraint.activate([
            centerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            centerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            centerImageView.topAnchor.constraint(equalTo: topAnchor),
            centerImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
       
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("not init")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    func drawCircle(radius: CGFloat, center: CGPoint) {
        let circularShape = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        circularShape.path = circularPath.cgPath
        circularShape.strokeColor = UIColor.gray.cgColor
        circularShape.lineWidth = 2
        circularShape.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(circularShape)
        
    }
}
