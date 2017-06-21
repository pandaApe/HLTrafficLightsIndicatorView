//
//  ViewController.swift
//  CheBaDaLoading
//
//  Created by PandaApe on 19/06/2017.
//  Copyright © 2017 RJS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let shapLayer = CAShapeLayer()
    
    let redLayer = CAShapeLayer()
    let yellowLayer = CAShapeLayer()
    let greenLayer = CAShapeLayer()
    
    let yellowPointLayer    = CALayer()
    let yellowPointLayer1   = CALayer()
    
    let redPointLayer       = CALayer()
    let redPointLayer1      = CALayer()
    
    let greenPointLayer         = CALayer()
    let greenPointLayer1        = CALayer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        return
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 200, y: 300))
        path.addArc(withCenter: CGPoint(x: 150, y: 300), radius: 50, startAngle: 0, endAngle: CGFloat.pi, clockwise: true)
        path.move(to: CGPoint(x: 100, y: 300))
        
        path.addLine(to: CGPoint(x: 100, y: 100))
        
        path.addArc(withCenter: CGPoint(x: 150, y: 100), radius: 50, startAngle:  CGFloat.pi, endAngle:0, clockwise: true)
        
        shapLayer.path = path.cgPath //6	122	240
        
        shapLayer.lineWidth = 10.0
        shapLayer.fillColor = UIColor.clear.cgColor
        shapLayer.strokeColor = UIColor(red: 6/255, green: 122/255, blue: 240/255, alpha: 1).cgColor
        shapLayer.lineCap = kCALineCapRound;
        shapLayer.lineJoin = kCALineCapRound;
        self.view.layer.addSublayer(shapLayer)
        
        
        let redPath = UIBezierPath()
        redPath.addArc(withCenter: CGPoint(x: 150, y: 120), radius: 30, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: true)
        redPath.addArc(withCenter: CGPoint(x: 150, y: 120), radius: 30, startAngle: CGFloat.pi/2, endAngle: -CGFloat.pi/2, clockwise: true)
        
        
        redLayer.path = redPath.cgPath //255	0	0
        
        redLayer.lineWidth = 10.0
        redLayer.fillColor = UIColor.clear.cgColor
        redLayer.strokeColor = UIColor.red.cgColor
        redLayer.lineCap = kCALineCapRound;
        redLayer.lineJoin = kCALineCapRound;
        self.view.layer.addSublayer(redLayer)
        
        
        let yellowPath = UIBezierPath()
        yellowPath.addArc(withCenter: CGPoint(x: 150, y: 200), radius: 30, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
        yellowPath.addArc(withCenter: CGPoint(x: 150, y: 200), radius: 30, startAngle: CGFloat.pi/2, endAngle: -CGFloat.pi/2, clockwise: false)
        
        
        yellowLayer.path = yellowPath.cgPath //255	192	1
        yellowLayer.lineCap = kCALineCapRound;
        yellowLayer.lineJoin = kCALineCapRound;
        yellowLayer.lineWidth = 10.0
        yellowLayer.fillColor = UIColor.clear.cgColor
        yellowLayer.strokeColor = UIColor(red: 255/255, green: 192/255, blue: 1/255, alpha: 1).cgColor
        
        self.view.layer.addSublayer(yellowLayer)
        
        
        let greenPath = UIBezierPath()
        greenPath.addArc(withCenter: CGPoint(x: 150, y: 280), radius: 30, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: true)
        greenPath.addArc(withCenter: CGPoint(x: 150, y: 280), radius: 30, startAngle: CGFloat.pi/2, endAngle: -CGFloat.pi/2, clockwise: true)
        
        
        greenLayer.path = greenPath.cgPath //18	222	125
        greenLayer.lineCap = kCALineCapRound;
        greenLayer.lineJoin = kCALineCapRound;
        greenLayer.lineWidth = 10.0
        greenLayer.fillColor = UIColor.clear.cgColor
        greenLayer.strokeColor = UIColor(red: 18/255, green: 222/255, blue: 125/255, alpha: 1).cgColor
        
        self.view.layer.addSublayer(greenLayer)
        
        
        yellowPointLayer.backgroundColor = UIColor(red: 255/255, green: 192/255, blue: 1/255, alpha: 1).cgColor
        
        yellowPointLayer.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        yellowPointLayer.cornerRadius = 15
        yellowPointLayer.position = CGPoint(x: 50, y: 80)
        
        self.view.layer.addSublayer(yellowPointLayer)
        
        yellowPointLayer1.backgroundColor = UIColor(red: 255/255, green: 192/255, blue: 1/255, alpha: 1).cgColor
        
        yellowPointLayer1.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        yellowPointLayer1.cornerRadius = 15
        yellowPointLayer1.position = CGPoint(x: 250, y: 350)
        
        self.view.layer.addSublayer(yellowPointLayer1)
        
        
        
        redPointLayer.backgroundColor = UIColor.red.cgColor
        
        redPointLayer.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        redPointLayer.cornerRadius = 15
        redPointLayer.position = CGPoint(x: 250, y: 130)
        
        self.view.layer.addSublayer(redPointLayer)
        
        redPointLayer1.backgroundColor = UIColor.red.cgColor
        
        redPointLayer1.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        redPointLayer1.cornerRadius = 15
        redPointLayer1.position = CGPoint(x: 30, y: 150)
        
        self.view.layer.addSublayer(redPointLayer1)
        
        
        greenPointLayer.backgroundColor = UIColor(red: 18/255, green: 222/255, blue: 125/255, alpha: 1).cgColor
        
        greenPointLayer.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        greenPointLayer.cornerRadius = 15
        greenPointLayer.position = CGPoint(x: 260, y: 250)
        
        self.view.layer.addSublayer(greenPointLayer)
        
        greenPointLayer1.backgroundColor = UIColor(red: 18/255, green: 222/255, blue: 125/255, alpha: 1).cgColor
        
        greenPointLayer1.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        greenPointLayer1.cornerRadius = 15
        greenPointLayer1.position = CGPoint(x: 30, y: 250)
        
        self.view.layer.addSublayer(greenPointLayer1)
        
        let timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector:  #selector(restart(_:)), userInfo: nil, repeats: true)

        timer.fire()
        
    }

    
    @IBAction func restart(_ sender: UIButton) {
        
        shapLayer.removeAllAnimations()
        
        redLayer.removeAllAnimations()
        yellowLayer.removeAllAnimations()
        greenLayer.removeAllAnimations()
        
        
        greenPointLayer.removeAllAnimations()
        greenPointLayer1.removeAllAnimations()
        
        redPointLayer.removeAllAnimations()
        redPointLayer1.removeAllAnimations()
        
        yellowPointLayer.removeAllAnimations()
        yellowPointLayer1.removeAllAnimations()
        

        let shapAnim = CABasicAnimation(keyPath: "strokeEnd")
        shapAnim.fromValue = 0.0
        shapAnim.toValue = 1.0
        shapAnim.duration = 1
        
        shapLayer.add(shapAnim, forKey: "anim")
        
        let shapAnimStart = CABasicAnimation(keyPath: "strokeStart")
        shapAnimStart.fromValue = 0.0
        shapAnimStart.toValue = 1.0
        shapAnimStart.duration = 1
        shapAnimStart.beginTime = CACurrentMediaTime() + 1
        
        shapLayer.add(shapAnimStart, forKey: "anim1")
        
        let redLayerStrokeAnim = CABasicAnimation(keyPath: "strokeEnd")
        redLayerStrokeAnim.fromValue = 0.0
        redLayerStrokeAnim.toValue = 1.0
        redLayerStrokeAnim.duration = 0.4

        let redLayerFillAnim = CABasicAnimation(keyPath: "fillColor")
        redLayerFillAnim.fromValue = UIColor.red.cgColor
        redLayerFillAnim.toValue = UIColor.red.cgColor
        redLayerFillAnim.duration = 0.20
        redLayerFillAnim.beginTime = 0.5
        
        let redLayerAnim = CAAnimationGroup()
        redLayerAnim.animations = [redLayerStrokeAnim, redLayerFillAnim]
        redLayerAnim.duration = 0.7
        redLayerAnim.beginTime = CACurrentMediaTime() + 0.1
        redLayerAnim.autoreverses = true
        redLayer.add(redLayerAnim, forKey: "redLayerAnim")

        
        
        let yellowLayerStrokeAnim = CABasicAnimation(keyPath: "strokeEnd")
        yellowLayerStrokeAnim.fromValue = 0.0
        yellowLayerStrokeAnim.toValue = 1.0
        yellowLayerStrokeAnim.duration = 0.4
        
        let yellowLayerFillAnim = CABasicAnimation(keyPath: "fillColor")
        yellowLayerFillAnim.fromValue = UIColor(red: 255/255, green: 192/255, blue: 1/255, alpha: 1).cgColor
        yellowLayerFillAnim.toValue = UIColor(red: 255/255, green: 192/255, blue: 1/255, alpha: 1).cgColor
        yellowLayerFillAnim.duration = 0.2
        yellowLayerFillAnim.beginTime = 0.5
        
        let yellowLayerAnim = CAAnimationGroup()
        yellowLayerAnim.animations = [yellowLayerStrokeAnim, yellowLayerFillAnim]
        yellowLayerAnim.duration = 0.7
        yellowLayerAnim.beginTime = CACurrentMediaTime() + 0.4
        yellowLayerAnim.autoreverses = true
        yellowLayerAnim.fillMode = kCAFillModeBackwards
        yellowLayer.add(yellowLayerAnim, forKey: "layerAnim")
        

        let greenLayerStrokeAnim = CABasicAnimation(keyPath: "strokeEnd")
        greenLayerStrokeAnim.fromValue = 0.0
        greenLayerStrokeAnim.toValue = 1.0
        greenLayerStrokeAnim.duration = 0.4
        
        let greenLayerFillAnim = CABasicAnimation(keyPath: "fillColor")
        greenLayerFillAnim.fromValue = UIColor(red: 18/255, green: 222/255, blue: 125/255, alpha: 1).cgColor
        greenLayerFillAnim.toValue = UIColor(red: 18/255, green: 222/255, blue: 125/255, alpha: 1).cgColor
        greenLayerFillAnim.duration = 0.2
        greenLayerFillAnim.beginTime = 0.5
        
        let greenLayerAnim = CAAnimationGroup()
        greenLayerAnim.animations = [greenLayerStrokeAnim, greenLayerFillAnim]
        greenLayerAnim.duration = 0.7
        greenLayerAnim.beginTime = CACurrentMediaTime() + 0.6
        greenLayerAnim.autoreverses = true
        
        greenLayer.add(greenLayerAnim, forKey: "layerAnim")
        

        let pointAnim = CABasicAnimation(keyPath: "transform.scale")
        
        pointAnim.fromValue = 0
        pointAnim.toValue = 1
        pointAnim.duration = 0.2
        pointAnim.autoreverses = true
        pointAnim.fillMode = kCAFillModeBackwards
        
        redPointLayer.add(pointAnim, forKey:  "layerAnim")

        pointAnim.beginTime = CACurrentMediaTime() + 0.4
        redPointLayer1.add(pointAnim, forKey:  "layerAnim")
        
        pointAnim.beginTime = CACurrentMediaTime() + 0.8
        yellowPointLayer.add(pointAnim, forKey:  "layerAnim")
        
        pointAnim.beginTime = CACurrentMediaTime() + 1.0
        greenPointLayer1.add(pointAnim, forKey:  "layerAnim")
        
        pointAnim.beginTime = CACurrentMediaTime() + 1.3
        yellowPointLayer1.add(pointAnim, forKey:  "layerAnim")

        
        pointAnim.beginTime = CACurrentMediaTime() + 1.6
        greenPointLayer.add(pointAnim, forKey:  "layerAnim")
  
    }
    
}

