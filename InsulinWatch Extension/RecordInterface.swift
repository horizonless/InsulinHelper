//
//  InterfaceController.swift
//  InsulinWatch Extension
//
//  Created by Shenrui Zhang on 11/18/20.
//

import WatchKit
import Foundation


class RecordInterface: WKInterfaceController {
    
    
    @IBOutlet weak var picker: WKInterfacePicker!
    override func awake(withContext context: Any?) {
        
    }
    
    @IBAction func pickerDidChange(value: Int) {

    }
    
    @IBAction func setRatioNum(value: Int){

    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
