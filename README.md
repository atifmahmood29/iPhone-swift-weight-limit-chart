# iPhone-swift-weight-limit-chart
iPhone weight/limit chart with color area. Different color area for upper limit, lower limit and normal values. 

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
    
    
<img src="http://wisdomitsol.com/wp-content/uploads/2017/08/swift-iphone-limit-chart.png" />
