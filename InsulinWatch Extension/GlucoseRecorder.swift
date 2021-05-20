//
//  GlucoseRecorder.swift
//  InsulinWatch Extension
//
//  Created by Shenrui Zhang on 1/28/21.
//
import WatchKit
import Foundation
class GlucoseRecorder: WKInterfaceController {
    
    @IBOutlet weak var currentTimeLabel: WKInterfaceLabel!
    var timer = Timer();
    override func awake(withContext context: Any?) {
        getCurrentTime();
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    private func getCurrentTime() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentTime) , userInfo: nil, repeats: true)
    }

    @objc func currentTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        currentTimeLabel.setText(formatter.string(from: Date()))
    }
}
