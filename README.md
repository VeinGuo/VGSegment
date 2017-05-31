# VGSegment

A segment menu with line animation


![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg)
[![build](https://img.shields.io/circleci/project/github/RedSparr0w/node-csgo-parser.svg)](http://cocoadocs.org/docsets/VGSegment/1.0/)
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/VeinGuo/VGSegment/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/Pastel.svg?style=flat)](https://github.com/VeinGuo/VGSegment)
[![pod](https://img.shields.io/badge/pod-v1.0.1-red.svg)](http://cocoadocs.org/docsets/VGSegment/1.0/)

![demo1](https://github.com/VeinGuo/VGSegment/blob/master/demo1.gif)

![demo2](https://github.com/VeinGuo/VGSegment/blob/master/demo2.gif)

## Requirements

- Swift 3 
- iOS 8.0+ 
- XCode 8

## Usage

```swift
class ViewController: UIViewController, VGSegmentDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        let rect = CGRect(x: 0, y: 250, width: view.frame.width, height: 45)
        let titles = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
        
        let segment = VGSegment(frame: rect, titles: titles)
        segment.delegate = self
        view.addSubview(segment)
        
        var configuration: VGSegmentConfiguration {
            let configura = VGSegmentConfiguration()
            // TODO: configuration segment
            return configura
        }
        
        segment.configuration = configuration
    }
    
    func didSelectAtIndex(_ index: Int) {
        print("selectIndex:", index)
    }

}
```

## Installation
- Download VGSegment. Move to your project.

- Cocoapods

```
platform :ios, ‘8.0’
use_frameworks!
pod "VGSegment"
```

- Carthage

```
github "VeinGuo/VGSegment" ~> 1.0.1
```

## Version
- 1.0 Release (05/28/2017)
- 1.0.1 Release (05/31/2017)
