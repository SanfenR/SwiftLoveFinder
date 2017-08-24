//
//  ViewController.swift
//  LoveFinder
//
//  Created by fen san on 2017/8/24.
//  Copyright © 2017 sanfen. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var sex: UISegmentedControl!
    @IBOutlet weak var birth: UIDatePicker!
    @IBOutlet weak var heigthLab: UILabel!
    @IBOutlet weak var info: UITextView!
    @IBOutlet weak var height: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate = self
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func heigthValueChanged(_ sender: Any) {
        let senderUi = sender as! UISlider
        heigthLab.text = "\(Int(senderUi.value))cm"
    }
   
    @IBAction func submit(_ sender: Any) {

        let gen = sex.selectedSegmentIndex == 0 ? "高富帅" : "白富美"

        let gregorian = Calendar(identifier:Calendar.Identifier.gregorian)
        let now = Date()
        let components = gregorian.dateComponents([.year], from: birth.date, to: now)
        let age = components.year

        info.text = name.text! + gen + "\(age)" + heigthLab.text!
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
