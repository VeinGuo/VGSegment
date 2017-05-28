//
//  ViewController.swift
//  Example
//
//  Created by Vein on 2017/5/26.
//  Copyright © 2017年 Vein. All rights reserved.
//

import UIKit
import VGSegment

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

