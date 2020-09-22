//
//  GameViewController.swift
//  Accelerometer200921
//
//  Created by Shinya  on 2020/09/22.
//  Copyright © 2020 Shinya . All rights reserved.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    
    @IBOutlet private weak var awaImageView: UIImageView!
    let motionManager = CMMotionManager()
    var accelerationX: Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.01
            
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {
                (data, error) in
                self.accelerationX = (data?.acceleration.x)!
                self.awaImageView.center.x =
                self.awaImageView.center.x - CGFloat(self.accelerationX*20)
                
                if self.awaImageView.frame.orogin.x < 40 {
                    self.awaImageView.frame.origin = 40
                }
                if self.awaImageView.frame.origin.x > 260 {
                    self.awaImageView.frame.origin.x = 260
                }
            })
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
