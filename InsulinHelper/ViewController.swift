//
//  ViewController.swift
//  InsulinHelper
//
//  Created by Shenrui Zhang on 11/17/20.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var carbon: UITextField!
    @IBOutlet weak var fat: UITextField!
    @IBOutlet weak var protein: UITextField!
//    @IBOutlet weak var invokeCal: UIButton!
    @IBOutlet weak var outputLable: UILabel!
    @IBOutlet weak var numDiv: UILabel!
    let divideNumber = [10,11,12,13,14,15]
    var temp = "10"
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        
        picker.delegate =  self
        carbon.delegate = self
        fat.delegate = self
        protein.delegate = self
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func calculateInjectionValue(){
        print("pressed")
        var carbonInt: Int? = Int(carbon.text!)
        var fatInt: Int? = Int(fat.text!)
        var proteinInt: Int? = Int(protein.text!)
        let divNum: Int? = Int(numDiv.text!)
        if(carbonInt == nil){
            carbonInt = 0
        }
        if(fatInt == nil){
            fatInt = 0
        }
        if(proteinInt == nil){
            proteinInt = 0
        }
        let output = (carbonInt! * 4 + fatInt! * 9 + proteinInt! * 4) / 4
        let finalOutput = output / divNum!
        print(finalOutput)
        outputLable.text = String(finalOutput)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        carbon.resignFirstResponder()
        fat.resignFirstResponder()
        protein.resignFirstResponder()
        return true
    }

    
}

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return divideNumber.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(divideNumber[row])
    }
    
    
}

extension ViewController: UIPickerViewDelegate{
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
////        print(divideNumber[row])
//        numDiv.text = String(divideNumber[row])
//        return String(divideNumber[row])
//    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numDiv.text = String(divideNumber[row])
    }
}

