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
    
    let motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAccelerometer()
    }

    func startAccelerometer(){
        let motion = CMMotionManager()
        motion.accelerometerUpdateInterval = 1/60
        motion.startAccelerometerUpdates()
        
        let timer = Timer(fire: Date(), interval: 1/60, repeats: true
            , block: { (Timer) in
                guard let data = motion.accelerometerData else { return }
                self.updateLabels(x: data.acceleration.x, y: data.acceleration.y, z: data.acceleration.z)
        })
        
        RunLoop.current.add(timer, forMode: .default)
    }
    
    func updateLabels(x: Double, y: Double, z: Double) {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 3
        formatter.minimumFractionDigits = 3
        
        self.x.text = formatter.string(for: x)
        self.y.text = formatter.string(for: y)
        self.z.text = formatter.string(for: z)
    }
}

