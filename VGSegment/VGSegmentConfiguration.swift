//
//  VGSegmentConfiguration.swift
//  VGSegment
//
//  Created by Vein on 2017/5/26.
//  Copyright © 2017年 Vein. All rights reserved.
//

import UIKit

@objc public enum VGSegmentStyle: Int{
    case line
    case caterpillarLines
}

public class VGSegmentConfiguration {
    
    open var segmentBackgroundColor : UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    open var segmentTitleMargin : CGFloat = 15.0
    open var segmentStyle : VGSegmentStyle = .caterpillarLines
    open var normalTitleColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    open var selectedTitleColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    open var normalTitleFont : UIFont = UIFont.boldSystemFont(ofSize: 14)
    open var selectedTitleFont : UIFont = UIFont.boldSystemFont(ofSize: 16)
    open var segmentTitleFontEnlargeScale : CGFloat = 0.2

    open var indicatorColor : UIColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    open var indicatorHeight : CGFloat = 2.0
    open var indicatorCornerRadius : CGFloat = 2.0
    open var hideIndicator : Bool = false

    open var segmentSelectIndex : Int = 0
    open var animationDuration : TimeInterval = 0.3
    
    public init() {
        
    }
}
