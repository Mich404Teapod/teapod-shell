import UIKit

func main(_ argc: Int, _ argv: [Int8]?) -> Int {
    autoreleasepool {
        return Int(UIApplicationMain(Int32(argc), &argv, nil, NSStringFromClass(AppDelegate.self.self)))
    }
}


func plane(from anchor: ARPlaneAnchor?) -> SCNNode? {
    let plane = SCNPlane(width: CGFloat(anchor?.extent.x ?? 0.0), height: CGFloat(anchor?.extent.z ?? 0.0))
    
