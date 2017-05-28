//
//  VGSegment+Animation.swift
//  VGSegment
//
//  Created by Vein on 2017/5/28.
//  Copyright © 2017年 Vein. All rights reserved.
//

import UIKit
// move animation
extension VGSegment {
    func moveSelectionIndicator(_ indicator: UIView, fromeLabel: UILabel, toLabel: UILabel) {
        
        let normalTitleColor = configuration.normalTitleColor
        let selectedTitleColor = configuration.selectedTitleColor
        let normalTitleFont = configuration.normalTitleFont
        let selectedTitleFont = configuration.selectedTitleFont
        let animationDuration = configuration.animationDuration / 2
        
        let style = configuration.segmentStyle
    
        fromeLabel.textColor = normalTitleColor
        toLabel.textColor = selectedTitleColor
        
        let fromeFrame = fromeLabel.frame
        let toFrame = toLabel.frame
        
        UIView.animate(withDuration: animationDuration) {
            fromeLabel.font = normalTitleFont
            toLabel.font = selectedTitleFont
        };
        
        switch style {
        case .line:
            UIView.animate(withDuration: animationDuration, animations: {
                indicator.frame.origin.x = toLabel.frame.origin.x
                indicator.frame.size.width = toLabel.frame.width
            })
        case .caterpillarLines:
            if fromeFrame.origin.x < toFrame.origin.x {
                UIView.animate(withDuration: animationDuration, delay: 0, options: .curveLinear, animations: {
                    indicator.frame.size.width = fromeFrame.width + toFrame.width
                }, completion: { (completion) in
                    UIView.animate(withDuration: animationDuration, animations: {
                        indicator.frame.size.width =  toFrame.width
                        indicator.frame.origin.x = toFrame.origin.x
                    })
                })
            } else {
                UIView.animate(withDuration: animationDuration, delay: 0, options: .curveLinear, animations: {
                    indicator.frame.origin.x = toFrame.origin.x
                    indicator.frame.size.width = fromeFrame.width + toFrame.width
                }, completion: { (completion) in
                    UIView.animate(withDuration: animationDuration, animations: {
                        indicator.frame.size.width =  toFrame.width
                    })
                })
            }
        }
    }
}
