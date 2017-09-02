//
//  ViewController.swift
//  RKPieChart
//
//  Created by ridvank on 08/31/2017.
//  Copyright (c) 2017 ridvank. All rights reserved.
//

import UIKit
import RKPieChart

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstItem: RKPieChartItem = RKPieChartItem(ratio: 10, color: .red, title: "1th Item")
        let secondItem: RKPieChartItem = RKPieChartItem(ratio: 20, color: .blue, title: "2nd Item")
        let thirdItem: RKPieChartItem = RKPieChartItem(ratio: 30, color: .orange, title: "3rd Item")
        let fourthItem: RKPieChartItem = RKPieChartItem(ratio: 5, color: .green, title: "4th Item")
        let fifthItem: RKPieChartItem = RKPieChartItem(ratio: 35, color: .black, title: "5th Item")
        
        let chartView = RKPieChartView(items: [firstItem, secondItem, thirdItem, fourthItem, fifthItem])
        chartView.circleColor = UIColor.red.light
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.arcWidth = 30
        chartView.isIntensityActivated = true
        chartView.style = .butt
        chartView.isTitleViewHidden = false
        chartView.isAnimationActivated = true
        view.addSubview(chartView)

        chartView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        chartView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        chartView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chartView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
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


