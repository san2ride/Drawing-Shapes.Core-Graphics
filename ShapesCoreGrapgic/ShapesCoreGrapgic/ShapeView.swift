//
//  ShapeView.swift
//  ShapesCoreGrapgic
//
//  Created by don't touch me on 10/17/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class ShapeView: UIView {

    var currentShapeType: Int = 0
    
    init(frame: CGRect, shape: Int) {
        
        super.init(frame: frame)
        
        self.currentShapeType = shape
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        switch currentShapeType {
        case 0: drawLines()
        case 1: drawRectangle()
        case 2: drawCircle()
        default: print("default")
            
        }
    }
    
    func drawLines() {
        //1 Graphic Destination
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        
        //2 Drawing Lines/Width 5
        ctx.beginPath()
        ctx.move(to: CGPoint(x: 20.0, y: 20.0))
        ctx.addLine(to: CGPoint(x: 250.0, y: 100.0))
        ctx.addLine(to: CGPoint(x: 100.0, y: 200.0))
        ctx.setLineWidth(5)
        
        //3 Path is closed and drawn to the graphics context
        ctx.closePath()
        ctx.strokePath()
    }
        
    func drawRectangle() {
        
        let center = CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0)
        let rectangleWidth:CGFloat = 100.0
        let rectangleHeight:CGFloat = 100.0
        
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        
        //4 CGContextAddRect a rectangle is drwan/outline gray
        ctx.addRect(CGRect(x: center.x - (0.5 * rectangleWidth), y: center.y - (0.5 * rectangleHeight), width: rectangleWidth, height: rectangleHeight))
        ctx.setLineWidth(10)
        ctx.setStrokeColor(UIColor.gray.cgColor)
        ctx.strokePath()
        
        //5 Same rectangle is defined/fill color green
        ctx.setFillColor(UIColor.green.cgColor)
        
        ctx.addRect(CGRect(x: center.x - (0.5 * rectangleWidth), y: center.y - (0.5 * rectangleHeight), width: rectangleWidth, height: rectangleHeight))
        
        ctx.fillPath()
    }
        
    func drawCircle() {
        
        let center = CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0);
        
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        
                ctx.beginPath()
        
        //6 CGContextAddArc a circle is drawn
        ctx.setLineWidth(5)
        
        let x:CGFloat = center.x
        let y:CGFloat = center.y
        let radius: CGFloat = 100.0
        let endAngle: CGFloat = CGFloat(2 * M_PI)
        
        ctx.addArc(center: CGPoint(x: x,y: y), radius: radius, startAngle: 0, endAngle: endAngle, clockwise: true)
        
        ctx.strokePath()
            
    }

}
