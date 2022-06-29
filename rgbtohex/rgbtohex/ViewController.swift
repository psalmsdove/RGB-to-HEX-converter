//
//  ViewController.swift
//  rgbtohex
//
//  Created by Ali Erdem Kökcik on 28.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblSelectedColor: UILabel!
    
    var secilenIndex : Int = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        btnConvert.layer.cornerRadius = 9.0
        // Do any additional setup after loading the view.
    }


    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        secilenIndex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtBlue.text?.removeAll()
        txtGreen.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        if secilenIndex == 0 {
            btnConvert.setTitle("RGB to HEX", for: UIControl.State.normal)
        } else{
            btnConvert.setTitle("HEX to RGB", for: UIControl.State.normal)
        }
    }
    
    @IBAction func btnConvertClicked(_ sender: Any) {
        if secilenIndex == 0{
            //rgb to hex
            convertRGBtoHEX()
        } else {
            //hex to rgb
            convertHEXtoRGB()
                    }
    }
    
    func convertRGBtoHEX(){
        if let redValue = UInt8(txtRed.text!){
            if let greenValue = UInt8(txtGreen.text!) {
                if let blueValue = UInt8(txtBlue.text!) {
                    
                    let redHex = String(format: "%2X", redValue)
                    let greenHex = String(format: "%2x", greenValue)
                    let blueHex = String(format: "%2x", blueValue)
                    
                    lblResult.text = "HEX Color: #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
        }
    }
}
    }
    func convertHEXtoRGB(){
        if let redValue = UInt8(txtRed.text!, radix: 16){
            if let greenValue = UInt8(txtGreen.text!, radix: 16){
                if let blueValue = UInt8(txtBlue.text!, radix: 16){
                    lblResult.text = "Red: \(redValue)\n Green: \(greenValue) \n Blue: \(blueValue)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                    
                }
            }
        }
    }

}

