//
//  ViewController.swift
//  MiraclePill
//
//  Created by Amy Roberson on 9/14/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryEntry: UITextField!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var zipCodeEntry: UITextField!
    
    
    
    let states = ["Alaska", "Alabama", "Arkansas", "Other State"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func stateBtnPressed(_ sender: AnyObject) {
        statePicker.isHidden = false
        zipCodeEntry.isHidden = true
        zipCodeLabel.isHidden = true
        countryEntry.isHidden = true
        countryLabel.isHidden = true
        
        
    }
    
    @IBAction func buyNowBtnPressed(_ sender: AnyObject) {
        let viewController = SuccessViewController(nibName: "SuccessViewController", bundle: Bundle.main)
        self.present(viewController, animated: true)
            
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        zipCodeLabel.isHidden = false
        zipCodeEntry.isHidden = false
        countryLabel.isHidden = false
        countryEntry.isHidden = false
    }
}

