//
//  ViewController.swift
//  weight-limit-chart
//
//  Created by Atif Mahmood on 27/08/2017.
//  Copyright © 2017 WisdomITSol. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfUpperLimit: UITextField!
    @IBOutlet weak var tfLowerLimit: UITextField!
    @IBOutlet weak var tfCurrentValue: UITextField!
    @IBOutlet weak var chartView: LimitLineChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfUpperLimit.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tfUpperLimit.delegate = self;
        
        tfLowerLimit.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tfLowerLimit.delegate = self;
        
        tfCurrentValue.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tfCurrentValue.delegate = self;
        
        drawChart();
    }

    func textFieldDidChange(textField: UITextField){
        
        drawChart();
        
    }
    
    func drawChart(){
        
        if((tfUpperLimit.text?.characters.count)! <= 0
            || (tfLowerLimit.text?.characters.count)! <= 0
            || (tfCurrentValue.text?.characters.count)! <= 0
            ){
            return;
        }
     
        chartView.upperLimit = getCGFloat(str: tfUpperLimit.text!);
        chartView.lowerLimit = getCGFloat(str: tfLowerLimit.text!);
        chartView.currentValue = getCGFloat(str: tfCurrentValue.text!);
        
        chartView.setNeedsDisplay();
        
    }
    
    func getCGFloat(str: String) -> CGFloat{
        return CGFloat(Float(str)!);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

