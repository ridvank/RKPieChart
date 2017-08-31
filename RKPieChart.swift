//
//  RKPieChart.swift
//  Pods
//
//  Created by ridvan kuccuk on 31/08/2017.
//
//

import CoreGraphics

let π: CGFloat = CGFloat(Double.pi)

@IBDesignable class RKPieChart: UIView {
    
    @IBInspectable var style: CGLineCap = .round
    @IBInspectable var circleColor: UIColor = .white
    @IBInspectable var arcWidth: CGFloat = 76
    
    override func draw(_ rect: CGRect) {
        
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        
        // radius of the view
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        // 3
        let arcWidth: CGFloat = self.arcWidth
        
        // 4
        let startAngle: CGFloat = 3 * π / 2
        let endAngle: CGFloat = π / 2
        
        
        let circlePath = UIBezierPath(arcCenter: center,
                                radius: radius/2 - arcWidth/2,
                                startAngle: 0,
                                endAngle: 2 * π,
                                clockwise: true)
        
        // draw circle path
        circlePath.lineWidth = arcWidth
        circleColor.setStroke()
        circlePath.lineCapStyle = style
        circlePath.stroke()
        
        // first draw path
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        // 6
        path.lineWidth = arcWidth
        UIColor.red.setStroke()
        path.lineCapStyle = style
        path.stroke()
        
    }
    
}
