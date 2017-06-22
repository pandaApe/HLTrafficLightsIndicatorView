//
//  ViewController.swift
//  HLTrafficLightsIndicatorView
//
//  Created by pandaape on 06/22/2017.
//  Copyright (c) 2017 pandaape. All rights reserved.
//

import UIKit
import HLTrafficLightsIndicatorView
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view = HLTrafficLightsIndicatorView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        
        self.view.addSubview(view)
        
    }

}

