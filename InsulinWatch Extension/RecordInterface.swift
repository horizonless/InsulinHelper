//
//  InterfaceController.swift
//  InsulinWatch Extension
//
//  Created by Shenrui Zhang on 11/18/20.
//

import WatchKit
import Foundation
import UserNotifications

class RecordInterface: WKInterfaceController {
    
    @IBOutlet weak var amountPicker: WKInterfacePicker!
    var insulinAmount: [WKPickerItem]?
    var finalAmount: Int!
    @IBOutlet weak var SetBtn: WKInterfaceButton!
    override func awake(withContext context: Any?) {
        insulinAmount = (1...40).map {
            let insulinAmount = WKPickerItem()
            insulinAmount.title = "\($0)"
            return insulinAmount
        }
        
        amountPicker.setItems(insulinAmount)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert]) { success, error in
            if success {
                print("Ok!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func PickerForAmount(_ value: Int) {
        let insulinAmount = insulinAmount![value] // value = 0..576
        if let pickedValue = Int(insulinAmount.title!) {
            finalAmount = pickedValue
            print(finalAmount)
        }
        //set notification alarm
//        Timer.scheduledTimer(timeInterval: 1.0, invocation: <#T##NSInvocation#>, repeats: <#T##Bool#>)
//        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert]) { success, error in
//            if success {
//                print("Ok!")
//            } else if let error = error {
//                print(error.localizedDescription)
//            }
//        }
//        let center = UNUserNotificationCenter.current()
//        center.removeAllPendingNotificationRequests()
//        let content = UNMutableNotificationContent()
//        content.title = "Check Sugar"
//        content.body = "some body here"
//        content.sound = .default
//
//        var dateComponents = DateComponents()
//        dateComponents.hour = 1
//        dateComponents.minute = 1
//        dateComponents.second = 5
////        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//        center.add(request)
    }
    
    @IBAction func RecordAmount() {
        print("Press Button")
//        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert]) { success, error in
//            if success {
//                print("Ok!")
//            } else if let error = error {
//                print(error.localizedDescription)
//            }
//        }
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        let content = UNMutableNotificationContent()
        content.title = "血糖提醒"
//        content.body = "距离上次注射" + (String)finalAmount + "单位已经过去1小时"
        if(finalAmount == nil){
            finalAmount = 1
        }
        content.body = String(format: "距离上次注射%d单位已经过去1小时", finalAmount)
        content.sound = .default
        
//        var dateComponents = DateComponents()
//        dateComponents.hour = 1
//        dateComponents.minute = 1
//        dateComponents.second = 5
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request) { error in
            if let error = error {
                // Do something with error
                print("error")
            } else {
                // Request was added successfully
                print("add success")
            }
        }
        RecordsListModel.recordList.AddRecord(record: InsulinRecordModel(time: GetCurrentTime(), amount: finalAmount, type: InsulinType.FastActing))
        SetBtn.setTitle("完成")
    }
    
    func GetCurrentTime() -> String {
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        print(formatter1.string(from: today))
        let formatter2 = DateFormatter()
        formatter2.timeStyle = .medium
        return formatter2.string(from: today)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
}
