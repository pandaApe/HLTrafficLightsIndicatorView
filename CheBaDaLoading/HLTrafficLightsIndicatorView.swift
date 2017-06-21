//
//  HLTrafficLightsIndicatorView.swift
//  CheBaDaLoading
//
//  Created by PandaApe on 20/06/2017.
//  Copyright © 2017 RJS. All rights reserved.
//

import UIKit

class HLTrafficLightsIndicatorView: UIView {

    fileprivate var durationRate: Double    = 0.7
    fileprivate var frameRate: CGFloat      = 1

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
        
        runwayPath.move(to: CGPoint(x: 125*frameRate, y: 40*frameRate))
        runwayPath.addArc(withCenter: CGPoint(x: 90*frameRate, y: 140*frameRate), radius: 35*frameRate, startAngle: 0, endAngle: CGFloat.pi, clockwise: true)
        runwayPath.move(to: CGPoint(x: 55*frameRate, y: 140*frameRate))
        runwayPath.addArc(withCenter: CGPoint(x: 90*frameRate, y: 40*frameRate), radius: 35*frameRate, startAngle:  CGFloat.pi, endAngle:0, clockwise: true)

       
        runwayLayer.path = runwayPath.cgPath
        
        runwayLayer.lineWidth     = 10.0*CGFloat(frameRate)
        runwayLayer.fillColor     = UIColor.clear.cgColor
        runwayLayer.strokeColor   = UIColor(red: 6/255, green: 122/255, blue: 240/255, alpha: 1).cgColor
        runwayLayer.lineCap       = kCALineCapRound;
        runwayLayer.lineJoin      = kCALineCapRound;
        
        self.layer.addSublayer(runwayLayer)
 
        redCircleLayer      = drawCircle(withCenter: CGPoint(x: 90*frameRate, y: 45*frameRate), strokeColor: UIColor.red, radius: 15*frameRate, lineWidth: 10*frameRate)
        yellowCircleLayer   = drawCircle(withCenter: CGPoint(x: 90*frameRate, y: 90*frameRate), strokeColor: UIColor.orange, radius: 15*frameRate, lineWidth: 10*frameRate)
        greenCircleLayer    = drawCircle(withCenter: CGPoint(x: 90*frameRate, y: 135*frameRate), strokeColor: UIColor.green, radius: 15*frameRate, lineWidth: 10*frameRate)
        
        self.layer.addSublayer(redCircleLayer)
        self.layer.addSublayer(yellowCircleLayer)
        self.layer.addSublayer(greenCircleLayer)
        
        
         redPoint0 = drawPoint(withCenter:  CGPoint(x: 150*frameRate, y: 50*frameRate), strokeColor: UIColor.red, diameter: 15*frameRate)
         redPoint1 = drawPoint(withCenter:  CGPoint(x: 40*frameRate, y: 90*frameRate), strokeColor: UIColor.red, diameter: 15*frameRate)
        
         yellowPoint0 = drawPoint(withCenter:  CGPoint(x: 30*frameRate, y: 20*frameRate), strokeColor: UIColor.orange, diameter: 15*frameRate)
         yellowPoint1 = drawPoint(withCenter:  CGPoint(x: 150*frameRate, y: 140*frameRate), strokeColor: UIColor.orange, diameter: 15*frameRate)
        
         greenPoint0 = drawPoint(withCenter:  CGPoint(x: 15*frameRate, y: 70*frameRate), strokeColor: UIColor.green, diameter: 15)
         greenPoint1 = drawPoint(withCenter:  CGPoint(x: 160*frameRate, y: 90*frameRate), strokeColor: UIColor.green, diameter: 15)
        
        
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
        
        addRunwayLayerAnimation()
        
        addCircleLayerAnimation(redCircleLayer, fillColor: UIColor.red, delay: 0.2*durationRate)
        addCircleLayerAnimation(yellowCircleLayer, fillColor: UIColor.orange, delay: 0.4*durationRate)
        addCircleLayerAnimation(greenCircleLayer, fillColor: UIColor.green, delay: 0.6*durationRate)

        addPointLayerAnimation(redPoint0, delay: 0.1*durationRate)
        addPointLayerAnimation(redPoint1, delay: 0.4*durationRate)
        
        addPointLayerAnimation(yellowPoint0, delay: 0.7*durationRate)
        addPointLayerAnimation(yellowPoint1, delay: 1*durationRate)
        
        addPointLayerAnimation(greenPoint0, delay: 1.3*durationRate)
        addPointLayerAnimation(greenPoint1, delay: 1.6*durationRate)
        
    }
    
    fileprivate func addRunwayLayerAnimation() {
       
        let strokeEndAnim = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnim.fromValue = 0.0
        strokeEndAnim.toValue = 1.0
        strokeEndAnim.duration = 0.7*durationRate
        strokeEndAnim.fillMode = kCAFillModeForwards
        
        let jumpAnim = CAKeyframeAnimation(keyPath: "transform.translation.x")
//        jumpAnim.values = 
//        runwayLayer.transform
        jumpAnim.duration = 0.2*durationRate
        jumpAnim.fillMode = kCAFillModeForwards
        
        let strokeStartAnim = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnim.fromValue = 0.0
        strokeStartAnim.toValue = 1.0
        strokeStartAnim.duration = 0.7*durationRate
        strokeStartAnim.beginTime = 1.3*durationRate
        
        let runwayLayerAnimaiton = CAAnimationGroup()
        runwayLayerAnimaiton.animations = [strokeEndAnim, jumpAnim, strokeStartAnim]
        runwayLayerAnimaiton.duration = 2*durationRate
        runwayLayerAnimaiton.beginTime = CACurrentMediaTime()
        runwayLayerAnimaiton.repeatCount = .infinity
        runwayLayerAnimaiton.fillMode = kCAFillModeBoth
        runwayLayerAnimaiton.isRemovedOnCompletion = false
        
        runwayLayer.add(runwayLayerAnimaiton, forKey: "strokeStartAnim")
    }
    
    fileprivate func addCircleLayerAnimation(_ toLayer: CALayer, fillColor: UIColor, delay: CFTimeInterval) {
        
        let strokeEndAnim          = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnim.fromValue    = -0.1
        strokeEndAnim.toValue      = 1.0
        strokeEndAnim.duration     = 0.5*durationRate
        strokeEndAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        let fillColorAnim           = CABasicAnimation(keyPath: "fillColor")
        fillColorAnim.fromValue     = fillColor.cgColor
        fillColorAnim.toValue       = fillColor.cgColor
        fillColorAnim.duration      = 0.2*durationRate
        fillColorAnim.beginTime     = 0.5*durationRate
        fillColorAnim.fillMode      = kCAFillModeForwards
        fillColorAnim.isRemovedOnCompletion = false
        
        let topLayerAnim            = CAAnimationGroup()
        topLayerAnim.animations     = [strokeEndAnim, fillColorAnim]
        topLayerAnim.duration       = 0.7*durationRate
        topLayerAnim.beginTime      = delay
        topLayerAnim.autoreverses   = true
        topLayerAnim.fillMode       = kCAFillModeBoth
        topLayerAnim.isRemovedOnCompletion = false
        
        let topLayerAnimContainer           = CAAnimationGroup()
        topLayerAnimContainer.animations    = [topLayerAnim]
        topLayerAnimContainer.duration      = 2*durationRate
        topLayerAnimContainer.beginTime     = CACurrentMediaTime()
        topLayerAnimContainer.repeatCount   = .infinity
        
        toLayer.add(topLayerAnimContainer, forKey: "layerAnim")
    }
    
    fileprivate func addPointLayerAnimation(_ toLayer: CALayer, delay: CFTimeInterval) {
        
        let pointAnim           = CABasicAnimation(keyPath: "transform.scale")
        
        pointAnim.fromValue     = 0
        pointAnim.toValue       = 1
        pointAnim.duration      = 0.2*durationRate
        pointAnim.autoreverses  = true
        pointAnim.beginTime     = delay
        pointAnim.fillMode      = kCAFillModeBoth
        pointAnim.isRemovedOnCompletion = false
        
        let pointLayerAnimContainer           = CAAnimationGroup()
        pointLayerAnimContainer.animations    = [pointAnim]
        pointLayerAnimContainer.duration      = 2*durationRate
        pointLayerAnimContainer.beginTime     = CACurrentMediaTime()
        pointLayerAnimContainer.repeatCount   = .infinity

        toLayer.add(pointLayerAnimContainer, forKey: "layerAnim")

    }

    fileprivate func animationValues(fromValue: CGFloat, toValue: CGFloat, usingSpringWithDamping damping: CGFloat, initialSpringVelocity velocity: CGFloat,  duration: Double) -> [CGFloat] {
        
        
        let numOfPoints = duration*60
        
        var values = [CGFloat]()
        
        
        let dValue = toValue - fromValue
        
        for index in 0 ... Int(numOfPoints) {
            
            let x = CGFloat(index)/CGFloat(numOfPoints)
            let value = toValue - dValue * CGFloat( pow(M_E, -Double(damping*x))*Double(cos(velocity*x)))
            
            values.append(value)
            
        }
        return values;
        
    }
    
    
}
