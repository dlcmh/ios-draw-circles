//
//  ViewController.swift
//  Circles
//
//  Created by David Chin on 10/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Determine the view's center, and make it the circle's center
        let viewWidth = view.frame.size.width
        let viewHeight = view.frame.size.height
        let circleCenter = view.center // CGPoint(x: viewWidth/2, y: viewHeight/2)
        
        // radius of circle that touches 2 screen edges on longer axis
        let circleRadiusTwoScreenEdgesOnLongerAxis = CGFloat(fmax(viewWidth/2, viewHeight/2))
        
        // radius of circle that touches 2 screen edges on shorter axis
        let circleRadiusTwoScreenEdgesOnShorterAxis = CGFloat(fmin(viewWidth/2, viewHeight/2))

        
        // radius of circle that touches 4 screen corners
        let circleRadiusFourScreenCorners = CGFloat(
            sqrt(
                pow(viewWidth/2, 2) + pow(viewHeight/2, 2)
            )
        )
        
        // http://stackoverflow.com/questions/29616992/how-do-i-draw-a-circle-in-ios-swift
        
        // Circle 1
        let circlePath1 = UIBezierPath(
            arcCenter: circleCenter,
            radius: circleRadiusTwoScreenEdgesOnLongerAxis,
            startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2),
            clockwise: true
        )
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = circlePath1.cgPath
        
        // change the fill color
        shapeLayer1.fillColor = UIColor.orange.cgColor
        
        // change the stroke color
        shapeLayer1.strokeColor = UIColor.magenta.cgColor
        
        // change the line width
        shapeLayer1.lineWidth = 3.0
        
        // Circle 2
        let circlePath2 = UIBezierPath(
            arcCenter: circleCenter,
            radius: circleRadiusFourScreenCorners,
            startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2),
            clockwise: true
        )
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = circlePath2.cgPath
        
        // change the fill color
        shapeLayer2.fillColor = UIColor.green.cgColor
        
        // Small circle using oval in rect
        let rectWidth = CGFloat(200)
        let circlePath3 = UIBezierPath(
            ovalIn: CGRect(
                x: (viewWidth - rectWidth)/2,
                y: (viewHeight - rectWidth)/2,
                width: rectWidth,
                height: rectWidth
            )
        )
        let shapeLayer3 = CAShapeLayer()
        shapeLayer3.path = circlePath3.cgPath
        shapeLayer3.fillColor = UIColor.yellow.cgColor
        
        // Circle 4
        let circlePath4 = UIBezierPath(
            ovalIn: CGRect(
                x: viewWidth/2 - circleRadiusTwoScreenEdgesOnShorterAxis,
                y: viewHeight/2 - circleRadiusTwoScreenEdgesOnShorterAxis,
                width: circleRadiusTwoScreenEdgesOnShorterAxis * 2,
                height: circleRadiusTwoScreenEdgesOnShorterAxis * 2)
        )
        let shapeLayer4 = CAShapeLayer()
        shapeLayer4.path = circlePath4.cgPath
        shapeLayer4.fillColor = UIColor.purple.cgColor
        
        // Add the layers, from back to front
        view.layer.addSublayer(shapeLayer2)
        view.layer.addSublayer(shapeLayer1)
        view.layer.addSublayer(shapeLayer4)
        view.layer.addSublayer(shapeLayer3)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

