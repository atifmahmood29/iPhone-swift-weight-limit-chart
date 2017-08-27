//
//  LimitLineChart.swift
//  weight-limit-chart
//
//  Created by Atif Mahmood on 27/08/2017.
//  Copyright © 2017 WisdomITSol. All rights reserved.
//

import Foundation
import UIKit;

//@IBDesignable
class LimitLineChart: UIView {
    
    private var mMinY: CGFloat = 0;
    private var mMaxY: CGFloat = 0;
    
    public var upperLimit: CGFloat = 16.44;
    public var normalValue: CGFloat = 16.14;
    public var lowerLimit: CGFloat = 14.32;
    public var currentValue: CGFloat = 18.0;
    
    //@IBInspectable var startColor: UIColor = UIColor.red
    
    override func draw(_ rect: CGRect) {
        
        //2 - get the current context
        let context = UIGraphicsGetCurrentContext()
        /*let colors = [startColor.cgColor, endColor.cgColor]
         
         //3 - set up the color space
         let colorSpace = CGColorSpaceCreateDeviceRGB()
         
         //4 - set up the color stops
         let colorLocations:[CGFloat] = [0.0, 1.0]
         
         //5 - create the gradient
         let gradient = CGGradient(colorsSpace: colorSpace,
         colors: colors as CFArray,
         locations: colorLocations)
         
         //6 - draw the gradient
         var startPoint = CGPoint();
         var endPoint = CGPoint(x:0, y:self.bounds.height)
         context!.drawLinearGradient(gradient!,
         start: startPoint,
         end: endPoint,
         options: CGGradientDrawingOptions(rawValue: 0))
         */
        //drawFilledArea(rect: rect, color: UIColor.blue);
        
        
        
        
        
        let height: CGFloat = bounds.height;
        mMaxY = upperLimit;// + 10;
        normalValue = mMaxY - lowerLimit;
        
        let total: CGFloat = mMaxY + normalValue + lowerLimit;
        let upperPerc: CGFloat = (mMaxY/total)*100.0;
        let normalPerc: CGFloat = (normalValue/total)*100.0;
        let lowerPerc: CGFloat = (lowerLimit/total)*100.0;
        let currentPerc: CGFloat = (currentValue/total)*100.0;
        
        let upperHeight: CGFloat = (upperPerc/100.0)*height;
        let normalHeight: CGFloat = (normalPerc/100.0)*height;
        let lowerHeight: CGFloat = (lowerPerc/100.0)*height;
        var currentVal: CGFloat = height - ((currentPerc/100.0)*height);
        if(currentVal >= height){
            currentVal = height - 10;
        }else if(currentVal <= 0){
            currentVal = 10;
        }
        
        // Upper
        var rec: CGRect = CGRect(x: 0, y: 0, width: self.bounds.width, height: upperHeight);
        //drawFilledArea(rect: rect, color: UIColor.green);
        drawFilledArea(rect: rec, color: UIColor.red);
        
        
        // Normal
        rec = CGRect(x: 0, y: upperHeight, width: self.bounds.width, height: normalHeight);
        drawFilledArea(rect: rec, color: UIColor.green);
        
        
        // Lower
        rec = CGRect(x: 0, y: upperHeight + normalHeight, width: self.bounds.width, height: lowerHeight);
        drawFilledArea(rect: rec, color: UIColor.yellow);
        
        var textColor = UIColor.white;
        var xAxis: CGFloat = 10;
        var fontSize: CGFloat = 15;
        let centerText: CGFloat = 7;
        drawText(text: "OVER", rect: CGRect(x: xAxis, y: (upperHeight/2)-centerText, width: bounds.width, height: bounds.height), color: textColor, fontSize: fontSize);
        drawText(text: "OK", rect: CGRect(x: xAxis, y: upperHeight + (normalHeight/2)-centerText, width: bounds.width, height: bounds.height), color: textColor, fontSize: fontSize);
        drawText(text: "UNDER", rect: CGRect(x: xAxis, y: upperHeight + normalHeight + (lowerHeight/2)-centerText, width: bounds.width, height: bounds.height), color: textColor, fontSize: fontSize);
        
        
        xAxis = bounds.width - (40/100)*bounds.width;
        fontSize = 9;
        drawText(text: "\(String(format:"%.2f", upperLimit)) upper limit" as NSString, rect: CGRect(x: xAxis, y: upperHeight-fontSize-2, width: bounds.width, height: bounds.height), color: textColor, fontSize: fontSize);
        drawText(text: "\(String(format:"%.2f", lowerLimit)) lower limit" as NSString, rect: CGRect(x: xAxis, y: upperHeight + normalHeight, width: bounds.width, height: bounds.height), color: textColor, fontSize: fontSize);
        
        
        xAxis = 50;
        drawLine(startPoint: CGPoint(x:0, y:currentVal), endPoint: CGPoint(x:bounds.width, y:currentVal), color: UIColor.blue);        
    }
    
    private func drawFilledArea(rect: CGRect, color: UIColor){
        var path = UIBezierPath(rect: rect);//CGRect(x: 0, y: self.bounds.height, width: self.bounds.width, height: self.bounds.height ))
        color.setFill();
        path.fill();
    }
    
    private func drawLine(startPoint: CGPoint, endPoint: CGPoint, color: UIColor){
        var path = UIBezierPath()
        //set the path's line width to the height of the stroke
        path.lineWidth = 2
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        path.move(to: startPoint)
        //add a point to the path at the end of the stroke
        path.addLine(to: endPoint)
        
        //set the stroke color
        color.setStroke();
        
        //draw the stroke
        path.stroke()
    }
    
    private func drawText(text: NSString, rect: CGRect, color: UIColor, fontSize: CGFloat){
        text.draw(in: rect, withAttributes: [NSForegroundColorAttributeName: color, NSFontAttributeName : UIFont.boldSystemFont(ofSize: fontSize)])
    }
    
}
