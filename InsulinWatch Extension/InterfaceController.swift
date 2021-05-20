//
//  InterfaceController.swift
//  InsulinWatch Extension
//
//  Created by Shenrui Zhang on 11/18/20.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var picker: WKInterfacePicker!
    @IBOutlet weak var ratioPicker: WKInterfacePicker!
    @IBOutlet weak var output: WKInterfaceLabel!
    var pickerItems: [WKPickerItem]?
    var pickerItemsRatio: [WKPickerItem]?
    var rationNumber: Int!
    var enerygNumber: Int!
    var energyNumberArray: [Int] = []
    var timer = Timer()
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        for i in 6...40{
            energyNumberArray.append(i * 50)
        }
        pickerItems = energyNumberArray.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = "\($0)"
            return pickerItem
        }
        pickerItemsRatio = (10...15).map {
            let pickerItemsRatio = WKPickerItem()
            pickerItemsRatio.title = "\($0)"
            return pickerItemsRatio
        }
        picker.setItems(pickerItems)
        ratioPicker.setItems(pickerItemsRatio)
    }
    
    @IBAction func pickerDidChange(value: Int) {
        let pickedItem = pickerItems![value] // value = 0..576
        if let pickedValue = Int(pickedItem.title!) {
            print(rationNumber!)
            enerygNumber = pickedValue
            let res = pickedValue / 4 / rationNumber
            output.setText(String(res))
        }

    }
    
    @IBAction func setRatioNum(value: Int){
        let pickerItem = pickerItemsRatio![value]
        if let pickedValue = Int(pickerItem.title!) {
            rationNumber = pickedValue
            let res = enerygNumber / 4 / pickedValue
            output.setText(String(res))
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
