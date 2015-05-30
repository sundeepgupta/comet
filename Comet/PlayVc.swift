import UIKit
import CoreMotion

class PlayVc: UIViewController {
    let motionManager = CMMotionManager()
    var timer = NSTimer()
    @IBOutlet weak var gravityXLabel: UILabel!
    @IBOutlet weak var gravityYLabel: UILabel!
    @IBOutlet weak var gravityZLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.motionManager.startDeviceMotionUpdates()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.motionManager.stopDeviceMotionUpdates()
    }
    deinit {
        self.motionManager.stopDeviceMotionUpdates()
    }
    
    func update() {
        let motion = motionManager.deviceMotion
        self.updateGravity(motion.gravity)
    }
    
    func updateGravity(gravity: CMAcceleration) {
        self.gravityXLabel.text = self.accelerationString(gravity.x)
        self.gravityYLabel.text = self.accelerationString(gravity.y)
        self.gravityZLabel.text = self.accelerationString(gravity.z)
    }
    
    func accelerationString(value: Double) -> String {
        return "\(value*100)"
    }
    
}

