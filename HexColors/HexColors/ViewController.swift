//
//  ViewController.swift
//  HexColors
//
//  Created by Josh Spicer on 8/24/17.
//  Copyright © 2017 Josh Spicer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI Slider outlets
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var bg: UIView!
    
    // Number outlets
    
    @IBOutlet weak var redNum: UITextField!
    
    @IBOutlet weak var greenNum: UITextField!
    
    @IBOutlet weak var blueNum: UITextField!
    
    
    // RGB variables
    var red: CGFloat! = 255
    var green: CGFloat! = 255
    var blue: CGFloat! = 255
    
    
    // Slider Actions
    
    @IBAction func redValueChanged(_ sender: UISlider) {
        red = CGFloat(redSlider.value)
        redNum.text = "\(Int(red))"
        updateAll()
        
    }
    
    @IBAction func greenValueChanged(_ sender: UISlider) {
        green = CGFloat(greenSlider.value)
        greenNum.text = "\(Int(green))"
        updateAll()
    }
    
    @IBAction func blueValueChanged(_ sender: UISlider) {
        blue = CGFloat(blueSlider.value)
        blueNum.text = "\(Int(blue))"
        updateAll()
    }
    
    
    // Number boxes actions
    
    @IBAction func rLabel(_ sender: UITextField) {
        print("before \(red)")
        if let label = Double(sender.text!) {
            red = checkRange(tempValue: CGFloat(label))
            sender.text = "\(Int(red))"
            updateAll()
        }
        print("after \(red)")
    }
    
    @IBAction func gLabel(_ sender: UITextField) {
        if let label = Double(sender.text!) {
            green = checkRange(tempValue: CGFloat(label))
            sender.text = "\(Int(green))"
            updateAll()
        }
    }
    
    @IBAction func bLabel(_ sender: UITextField) {
        if let label = Double(sender.text!) {
            blue = checkRange(tempValue: CGFloat(label))
            sender.text = "\(Int(blue))"
            updateAll()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // If you tap somewhere on the screen the number pad goes away!
        self.view.endEditing(true)
        
        // If user selects an number and leaves it blank, restore previous value.
        if(redNum.text == "") {
            redNum.text = "\(Int(red))"
        }
        if(greenNum.text == "") {
            greenNum.text = "\(Int(green))"
        }
        if(blueNum.text == "") {
            blueNum.text = "\(Int(blue))"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAll()
        
    }
    
    // If a change is made in one place, reflect that change everywhere
    func updateAll() {
        
        bg.backgroundColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Makes sure number entered is correct
    func checkRange(tempValue:CGFloat) -> CGFloat {
        
        if tempValue < CGFloat(0) {
            return 0
        }
        
        if tempValue > CGFloat(255.0) {
            return 255
        }
        
        return tempValue
    }
    
    
    
}

