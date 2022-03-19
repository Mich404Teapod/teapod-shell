   public init(device: IOHIDDevice) {
        self.device = device
        self.serialID = IOHIDDeviceGetProperty(device, kIOHIDSerialNumberKey as CFString) as? String ?? ""
        self.handlers = [:]
        self.spiReadHandler = [:]
        self.isConnected = false
        self.packetCounter = 0
        self.rumbleData = [0x00, 0x01, 0x00, 0x40, 0x00, 0x01, 0x00, 0x40]
        self.subcommandQueue = []
        self.battery = .unknown
        self.isCharging = false
        self.buttonState = [:]
        self.leftStickDirection = .Neutral
        self.rightStickDirection = .Neutral
        self.lStickRawPos = CGPoint(x: 0, y: 0)
        self.lStickPos = CGPoint(x: 0, y: 0)
        self.rStickRawPos = CGPoint(x: 0, y: 0)
        self.rStickPos = CGPoint(x: 0, y: 0)
        self.acceleration = SCNVector3(x: 0, y: 0, z: 0)
        self.gyro = SCNVector3(x: 0, y: 0, z: 0)
        self.bodyColor = CGColor(red: 0.333, green: 0.333, blue: 0.333, alpha: 0.333)
        self.buttonColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func readInitializeData(_ done: @escaping () -> Void) {
        self.readControllerColor {
            self.readCalibration()
            // TODO: Call done() after readCalibration() is done
            done()
        }
    }
    
    func handleError(result: Int32, value: IOHIDValue) {}

    func handleInput(value: IOHIDValue) {
        let element = IOHIDValueGetElement(value)
        let reportID = IOHIDElementGetReportID(element)
