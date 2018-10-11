//
//  ViewController.swift
//  Accelero
//
//  Created by Prudhvi Gadiraju on 10/10/18.
//  Copyright © 2018 Kore. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var x: UILabel!
    @IBOutlet weak var y: UILabel!
    @IBOutlet weak var z: UILabel!
    
    var motionManger: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManger.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }

    func updateLabels(data: CMAccelerometerData?, error: Error?) {
        print("Test")
    }
}

