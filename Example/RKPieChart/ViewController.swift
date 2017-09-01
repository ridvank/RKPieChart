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
        
        let firstItem: RKPieChartItem = RKPieChartItem(ratio: 60, color: UIColor.red)
        let secondItem: RKPieChartItem = RKPieChartItem(ratio: 30, color: UIColor.blue)
        let thirdItem: RKPieChartItem = RKPieChartItem(ratio: 10, color: UIColor.cyan)
        
        let items = [firstItem, secondItem, thirdItem]
        
        let chartView = RKPieChart(items: items)
        chartView.backgroundColor = .white
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.arcWidth = 60
        view.addSubview(chartView)

        chartView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        chartView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        chartView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chartView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}

