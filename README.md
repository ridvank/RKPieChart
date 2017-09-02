![RKPieChart: Super easy Pie Chart](https://github.com/ridvank/RKPieChart/blob/development/Screenshots/Screen%20Shot%202017-09-02%20at%2020.04.28.png)

[![Cocoapod](http://img.shields.io/cocoapods/v/RKPieChart.svg?style=flat)](http://cocoadocs.org/docsets/RKPieChart/)
[![CI Status](http://img.shields.io/travis/ridvank/RKPieChart.svg?style=flat)](https://travis-ci.org/ridvank/RKPieChart)
[![Version](https://img.shields.io/cocoapods/v/RKPieChart.svg?style=flat)](http://cocoapods.org/pods/RKPieChart)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://raw.githubusercontent.com/ridvank/RKPieChart/master/LICENSE)
[![Platform](http://img.shields.io/badge/platform-ios-lightgrey.svg?style=flat)](https://developer.apple.com/resources/)
[![Language](https://img.shields.io/badge/swift-3.1-orange.svg)](https://developer.apple.com/swift)

RKPieChart is super easy pie chart view written in Swift 3.

### Screenshots

<p align="center" imgContainer = "left">
<img src ="https://github.com/ridvank/RKPieChart/blob/development/Screenshots/chartView1.png" width="20%" height="20%"/>
<img src ="https://github.com/ridvank/RKPieChart/blob/development/Screenshots/chartView4.png" width="20%" height="20%"/>
<img src ="https://github.com/ridvank/RKPieChart/blob/development/Screenshots/chartView2.png" width="20%" height="20%"/>
<img src ="https://github.com/ridvank/RKPieChart/blob/development/Screenshots/chartView5.png" width="20%" height="20%"/>
</p>

### Animations
![0](https://github.com/ridvank/RKPieChart/blob/development/Screenshots/firstVideo.gif)
![1](https://github.com/ridvank/RKPieChart/blob/development/Screenshots/multipleValue.gif)

## Initalization

First of all single or multiple RKPieChartItem should be created. ```ratio``` and ```color``` are required but ```title``` variable is optional on init method.
```swift
let firstItem: RKPieChartItem = RKPieChartItem(ratio: 50, color: .orange, title: "1️⃣th Item ")
let secondItem: RKPieChartItem = RKPieChartItem(ratio: 30, color: .gray, title: "2️⃣nd Item")
let thirdItem: RKPieChartItem = RKPieChartItem(ratio: 20, color: .yellow, title: "3️⃣th Item")
```
Initalization is also simple; ```items``` variable is required and ```centerTitle``` variable is optional.
```swift
let chartView = RKPieChartView(items: [firstItem, secondItem, thirdItem], centerTitle: "I am title 🕶")
```
You can change background color of the pie chart circle:
```swift
chartView.circleColor = .green
```
To change the arc width of the chart:
```swift
chartView.arcWidth = 60
```
You can also give indensity to the chart by updating ```isIntensityActivated``` variable. ```false``` is the default behaviour.
```swift
chartView.isIntensityActivated = true
```
You can update the style of the pie chart. 3 types supported. ```butt```,```square``` and ```round```. If you have 1 item to show you can choose all of them. However If you have multiple item ```round``` and ```square``` not supported.
```swift
chartView.style = .butt
```
You can hide the ```RKPieChart``` item title if you want by using:
```swift
chartView.isTitleViewHidden = false
```
You can animate ```RKPieChart``` view if you want by using:
```swift
chartView.isAnimationActivated = true
```
Default type is ```false``` which means no animation will be executed.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* Xcode 8
* iOS 9.0+

## Installation

RKPieChart is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RKPieChart"
```

## Author

Ridvan Kuccuk, ridvankuccuk@gmail.com

## License

RKPieChart is available under the MIT license. See the LICENSE file for more info.
