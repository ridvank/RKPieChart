//
//  RKPieChart.swift
//  Pods
//
//  Created by ridvan kuccuk on 31/08/2017.
//
//

import CoreGraphics

let π: CGFloat = CGFloat(Double.pi)

private enum LineCapStyle: Int {
    
    case butt = 0
    case round
    case style
    
    var description: String {
        get { return String(describing: self) }
    }
}

public class RKPieChartView: UIView {
    
    fileprivate var items: [RKPieChartItem] = [RKPieChartItem]()
    private var titlesView: UIStackView?
    
    public var circleColor: UIColor = .white {
        didSet {
            setNeedsLayout()
        }
    }
    public var arcWidth: CGFloat = 75 {
        didSet {
            setNeedsLayout()
        }
    }
    public var isIntensityActivated: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    public var isTitleViewHidden: Bool = false {
        didSet {
            if !isTitleViewHidden {
                titlesView?.removeFromSuperview()
                updateConstraints()
            }
        }
    }
    public var style: CGLineCap = .butt {
        didSet {
            if (items.count != 1 && style != .butt) {
                assertionFailure("Number of items should be equal to 1 to update style")
                style = .butt
            }
            setNeedsLayout()
        }
    }
    public var isAnimationActivated: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
        
    private var totalRatio: CGFloat = 0
    private let itemHeight: CGFloat = 10.0
    
    private var currentTime = CACurrentMediaTime()
    
    override public func draw(_ rect: CGRect) {
        
        // Center of the view
        let center = calculateCenter()
        
        // Radius of the view
        let radius = calculateRadius()
        
        let arcWidth: CGFloat = self.arcWidth
        
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
        
        if (items.count > 0) {
            drawCircle()
        }
    }
    
    convenience public init(items: [RKPieChartItem]) {
        self.init()
        self.items = items
        calculateAngles()
        backgroundColor = .clear
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if !isTitleViewHidden {
            showTitle()
        }
    }
    
    private func drawCircle(){
        items.forEach { (item) in
            // Center of the view
            let center = calculateCenter()
            
            // Radius of the view
            let radius: CGFloat = calculateRadius()
            let arcWidth: CGFloat = self.arcWidth
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius/2 - arcWidth/2,
                                          startAngle: item.startAngle!,
                                          endAngle: item.endAngle!,
                                          clockwise: true)
            
            circlePath.lineCapStyle = style
            
            if(!isAnimationActivated) {
                // Draw circle path
                circlePath.lineWidth = arcWidth
                circlePath.lineCapStyle = style
                item.color.setStroke()
                circlePath.stroke()
            }
            else {
                let shapeLayer: CAShapeLayer = CAShapeLayer()
                shapeLayer.path = circlePath.cgPath
                shapeLayer.strokeColor = item.color.cgColor
                shapeLayer.lineWidth = arcWidth
                shapeLayer.fillColor = UIColor.clear.cgColor
                
                if let lineCap = (LineCapStyle(rawValue: Int(style.rawValue))?.description) {
                    shapeLayer.lineCap = lineCap
                }
                
                layer.addSublayer(shapeLayer)
                
                let animation = CABasicAnimation(keyPath: "strokeEnd")
                animation.duration = 0.5
                animation.fromValue = 0.0
                animation.toValue = 1.0
                shapeLayer.add(animation, forKey: "strokeEnd")
            }
            
            if (isIntensityActivated) {
                let deepPath = UIBezierPath(arcCenter: center,
                                            radius: radius/2 - arcWidth - 5,
                                            startAngle: item.startAngle!,
                                            endAngle: item.endAngle!,
                                            clockwise: true)
                deepPath.lineWidth = 10
                item.color.light.setStroke()
                deepPath.lineCapStyle = style
                deepPath.stroke()
            }
        }
    }
    
    private func calculateAngles() {
        totalRatio = items.map({ $0.ratio }).reduce(0, { $0 + $1 })
        for (index, item) in items.enumerated() {
            item.startAngle = index == 0 ? 3 * π / 2 : items[index - 1].endAngle
            if items.count == 1 {
                totalRatio = 100
            }
            item.endAngle = item.startAngle! + (360 * item.ratio / totalRatio).degreesToRadians
            if item.endAngle! > 2 * π {
                item.endAngle = item.endAngle! - 2 * π
            }
        }
    }
    
    private func showTitle() {
        if (titlesView == nil) {
            titlesView = UIStackView(frame: CGRect(x: 0, y: bounds.height - (CGFloat(2 * items.count) * itemHeight), width: bounds.width, height: CGFloat(2 * items.count) * itemHeight))
            titlesView?.backgroundColor = .gray
            titlesView?.axis = .vertical
            titlesView?.distribution  = .fillEqually
            titlesView?.alignment = .fill
            self.addSubview(titlesView!)
            
            items.forEach({ (item) in
                let view = RKChartTitleView(item: item)
                titlesView?.addArrangedSubview(view)
            })
        }
    }
    
    private func calculateCenter() -> CGPoint {
        if isTitleViewHidden {
            return CGPoint(x:bounds.width/2, y: bounds.height/2)
        }
        else {
            return CGPoint(x:bounds.width/2, y: bounds.height/2 - CGFloat(items.count) * itemHeight)
        }
    }
    
    private func calculateRadius() -> CGFloat {
        if isTitleViewHidden {
            return min(bounds.width, bounds.height)
        }
        else {
            return min(bounds.width - CGFloat(items.count) * 2 * itemHeight, bounds.height - CGFloat(items.count) * 2 * itemHeight)
        }
    }
}

private extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}

private extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

private extension UIColor {
    var dark: UIColor {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        
        if self.getRed(&r, green: &g, blue: &b, alpha: &a){
            return UIColor(red: max(r - 0.4, 0.0), green: max(g - 0.4, 0.0), blue: max(b - 0.4, 0.0), alpha: a)
        }
        
        return UIColor()
    }
    var light: UIColor {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        
        if self.getRed(&r, green: &g, blue: &b, alpha: &a){
            return UIColor(red: min(r + 0.4, 1.0), green: min(g + 0.4, 1.0), blue: min(b + 0.4, 1.0), alpha: a)
        }
        
        return UIColor()
    }

}
