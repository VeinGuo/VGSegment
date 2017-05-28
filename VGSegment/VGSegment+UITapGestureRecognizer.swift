//
//  VGSegment+UITapGestureRecognizer.swift
//  VGSegment
//
//  Created by Vein on 2017/5/27.
//  Copyright © 2017年 Vein. All rights reserved.
//

import UIKit

extension VGSegment : UIGestureRecognizerDelegate {
    func handleSegmentTap(_ gestureRecognizer : UITapGestureRecognizer) {
        let tappedPointX : CGFloat = gestureRecognizer.location(in: self).x + scrollView.contentOffset.x
        
        for (i, label) in titleLabels.enumerated() {
            if tappedPointX >= label.frame.minX && tappedPointX <= label.frame.maxX {
                //move 
                selectionTitle(index: i)
            }
        }
    }
}
