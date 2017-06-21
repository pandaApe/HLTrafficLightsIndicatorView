//
//  HLTrafficLightsIndicatorView.swift
//  CheBaDaLoading
//
//  Created by PandaApe on 20/06/2017.
//  Copyright © 2017 RJS. All rights reserved.
//

import UIKit

class HLTrafficLightsIndicatorView: UIView {


    override func awakeFromNib() {
        super.awakeFromNib()
        
        drawLayers()
        
        animateLayers()
    }
    
    
    fileprivate let runwayLayer         = CAShapeLayer()
    
    fileprivate var redCircleLayer      = CAShapeLayer()
    fileprivate var yellowCircleLayer   = CAShapeLayer()
    fileprivate var greenCircleLayer    = CAShapeLayer()
    
    fileprivate var redPoint0           = CALayer()
    fileprivate var redPoint1           = CALayer()
    
    fileprivate var yellowPoint0        = CALayer()
    fileprivate var yellowPoint1        = CALayer()
    
    fileprivate var greenPoint0         = CALayer()
    fileprivate var greenPoint1         = CALayer()
    

    fileprivate func drawLayers() {
        
        guard self.bounds.width == self.bounds.height else {
            
            return
        }

        // draw Runway layer
        
        let runwayPath = UIBezierPath()
        
        runwayPath.move(to: CGPoint(x: 125, y: 40))
        runwayPath.addArc(withCenter: CGPoint(x: 90, y: 140), radius: 35, startAngle: 0, endAngle: CGFloat.pi, clockwise: true)
        runwayPath.move(to: CGPoint(x: 55, y: 140))
        runwayPath.addArc(withCenter: CGPoint(x: 90, y: 40), radius: 35, startAngle:  CGFloat.pi, endAngle:0, clockwise: true)

       
        runwayLayer.path = runwayPath.cgPath
        
        runwayLayer.lineWidth     = 10.0
        runwayLayer.fillColor     = UIColor.clear.cgColor
        runwayLayer.strokeColor   = UIColor(red: 6/255, green: 122/255, blue: 240/255, alpha: 1).cgColor
        runwayLayer.lineCap       = kCALineCapRound;
        runwayLayer.lineJoin      = kCALineCapRound;
        
        self.layer.addSublayer(runwayLayer)
 
        redCircleLayer      = drawCircle(withCenter: CGPoint(x: 90, y: 45), strokeColor: UIColor.red, radius: 15, lineWidth: 10)
        yellowCircleLayer   = drawCircle(withCenter: CGPoint(x: 90, y: 90), strokeColor: UIColor.orange, radius: 15, lineWidth: 10)
        greenCircleLayer    = drawCircle(withCenter: CGPoint(x: 90, y: 135), strokeColor: UIColor.green, radius: 15, lineWidth: 10)
        
        self.layer.addSublayer(redCircleLayer)
        self.layer.addSublayer(yellowCircleLayer)
        self.layer.addSublayer(greenCircleLayer)
        
        
         redPoint0 = drawPoint(withCenter:  CGPoint(x: 150, y: 50), strokeColor: UIColor.red, diameter: 10)
         redPoint1 = drawPoint(withCenter:  CGPoint(x: 40, y: 90), strokeColor: UIColor.red, diameter: 10)
        
         yellowPoint0 = drawPoint(withCenter:  CGPoint(x: 30, y: 20), strokeColor: UIColor.orange, diameter: 10)
         yellowPoint1 = drawPoint(withCenter:  CGPoint(x: 150, y: 140), strokeColor: UIColor.orange, diameter: 10)
        
         greenPoint0 = drawPoint(withCenter:  CGPoint(x: 15, y: 70), strokeColor: UIColor.green, diameter: 10)
         greenPoint1 = drawPoint(withCenter:  CGPoint(x: 160, y: 90), strokeColor: UIColor.green, diameter: 10)
        
        
        self.layer.addSublayer(redPoint0)
        self.layer.addSublayer(redPoint1)
        self.layer.addSublayer(yellowPoint0)
        self.layer.addSublayer(yellowPoint1)
        self.layer.addSublayer(greenPoint0)
        self.layer.addSublayer(greenPoint1)
        

 
    }
    
    fileprivate func drawPoint(withCenter center: CGPoint, strokeColor: UIColor, diameter: CGFloat) -> CALayer{
        
        let pointLayer              = CALayer()
        pointLayer.position         = center
        pointLayer.bounds           = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        pointLayer.cornerRadius     = diameter/2
        pointLayer.backgroundColor  = strokeColor.cgColor

        return pointLayer
    }
    
    fileprivate func drawCircle(withCenter center:CGPoint, strokeColor: UIColor, radius: CGFloat, lineWidth: CGFloat) -> CAShapeLayer {
        
        let path                = UIBezierPath()
        path.addArc(withCenter: center, radius: radius, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: true)
        path.addArc(withCenter: center, radius: radius, startAngle: CGFloat.pi/2, endAngle: -CGFloat.pi/2, clockwise: true)
        
        let shapeLayer          = CAShapeLayer()
        shapeLayer.path         = path.cgPath
        shapeLayer.lineWidth    = lineWidth
        shapeLayer.fillColor    = UIColor.clear.cgColor
        shapeLayer.strokeColor  = strokeColor.cgColor
        shapeLayer.lineCap      = kCALineCapRound;
        shapeLayer.lineJoin     = kCALineCapRound;
        
        return shapeLayer
    }
    
    fileprivate func animateLayers() {
        
        let shapAnim = CABasicAnimation(keyPath: "strokeEnd")
        shapAnim.fromValue = 0.0
        shapAnim.toValue = 1.0
        shapAnim.duration = 1
        
        runwayLayer.add(shapAnim, forKey: "anim")
        
        let shapAnimStart = CABasicAnimation(keyPath: "strokeStart")
        shapAnimStart.fromValue = 0.0
        shapAnimStart.toValue = 1.0
        shapAnimStart.duration = 1
        shapAnimStart.beginTime = CACurrentMediaTime() + 1
        
        runwayLayer.add(shapAnimStart, forKey: "anim1")
        
        addCircleLayerAnimation(redCircleLayer, fillColor: UIColor.red, withDuration: 1, delay: 0.1)
        addCircleLayerAnimation(yellowCircleLayer, fillColor: UIColor.orange, withDuration: 1, delay: 0.4)
        addCircleLayerAnimation(greenCircleLayer, fillColor: UIColor.green,withDuration: 1, delay: 0.6)
        
    }
    
    func addCircleLayerAnimation(_ toLayer: CALayer, fillColor: UIColor, withDuration duration: CFTimeInterval, delay: CFTimeInterval) {
        
        
        let strokeEndAnim          = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnim.fromValue    = 0.0
        strokeEndAnim.toValue      = 1.0
        strokeEndAnim.duration     = 0.4
        strokeEndAnim.beginTime    = delay
        
        let fillColorAnim            = CABasicAnimation(keyPath: "fillColor")
        fillColorAnim.fromValue      = fillColor.cgColor
        fillColorAnim.toValue        = fillColor.cgColor
        fillColorAnim.duration       = 0.20
        fillColorAnim.beginTime      = 0.5 + delay
        
        let redLayerAnim            = CAAnimationGroup()
        redLayerAnim.animations     = [strokeEndAnim, fillColorAnim]
        redLayerAnim.duration       = duration
        redLayerAnim.beginTime      = CACurrentMediaTime()
        redLayerAnim.autoreverses   = true
        redLayerAnim.fillMode       = kCAFillModeForwards
        toLayer.add(redLayerAnim, forKey: "layerAnim")
    }
    
    
}
