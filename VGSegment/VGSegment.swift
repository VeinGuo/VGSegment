//
//  VGSegment.swift
//  VGSegment
//
//  Created by Vein on 2017/5/26.
//  Copyright © 2017年 Vein. All rights reserved.
//

import UIKit

@objc public protocol VGSegmentDelegate {
    // MARK: - Delegate func
    @objc optional func didSelectAtIndex(_ index: Int)
}

open class VGSegment: UIView{
    open var configuration = VGSegmentConfiguration () {
        didSet{
            reloadView()
        }
    }
    open var titles:[String] {
        didSet{
            guard oldValue != titles else { return }
            reloadView()
        }
    }
    
    open weak var delegate: VGSegmentDelegate?
    public var titleLabels: [UILabel] = []
    fileprivate var selectIndex: Int = 0
    fileprivate let indicator: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        return view
    }()
    
    public let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.bounces = true
        view.isPagingEnabled = false
        view.isScrollEnabled = true
        view.scrollsToTop = false
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    public convenience init(frame: CGRect, titles: [String] ) {
        self.init(frame:frame, segmentConfiguration: VGSegmentConfiguration(), titles: titles)
    }
    
    public init(frame: CGRect, segmentConfiguration: VGSegmentConfiguration, titles: [String]) {
        self.configuration = segmentConfiguration
        self.titles = titles;
        super.init(frame: frame)
        addSubview(UIView())
        addSubview(scrollView)
        reloadView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - public
extension VGSegment {
    
    public func selectionTitle(index: Int,animated: Bool = true) {
        if index >= 0 && index < titleLabels.count && selectIndex != index {
            
            let preSelectLabel = titleLabels[selectIndex]
            let selectLabel = titleLabels[index]
            let offsetX = min(max(0, selectLabel.center.x - bounds.width / 2),
                              max(0, scrollView.contentSize.width - bounds.width))
            scrollView.setContentOffset(CGPoint(x:offsetX, y: 0), animated: true)
            // move
            moveSelectionIndicator(indicator, fromeLabel: preSelectLabel, toLabel: selectLabel, animated: animated)
            selectIndex = index
            delegate?.didSelectAtIndex?(index)
            configuration.segmentSelectIndex = index
        }
    }
}

//MARK: - private
extension VGSegment {
    
    func labelSizeToFit(_ text: String, font: UIFont) -> CGFloat {
        let titleText = text as String
        let width = titleText.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: 0.0), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil).width
        return width
    }

    func setupTitleLabel(_ title: String, font: UIFont, index: Int, color: UIColor, frame: CGRect) {
        let titleLabel = UILabel(frame: CGRect.zero)
        titleLabel.tag = index
        titleLabel.text = title
        titleLabel.textColor = color
        titleLabel.font = font
        titleLabel.frame = frame
        titleLabel.textAlignment = .center
        titleLabels.append(titleLabel)
        scrollView.addSubview(titleLabel)
    }
    
    func setupIndicator(_ frame: CGRect) {
        if configuration.hideIndicator { return }
        
        indicator.backgroundColor = configuration.indicatorColor
        indicator.layer.cornerRadius = configuration.indicatorCornerRadius
        
        let height = configuration.indicatorHeight
        
        indicator.frame = frame
        indicator.frame.origin.y = bounds.height - height
        indicator.frame.size.height = height

        scrollView.addSubview(indicator)
    }
    
    fileprivate func reloadView() {
        
        cleanSegemtn()
        
        scrollView.frame = bounds;
        scrollView.backgroundColor = configuration.segmentBackgroundColor
        
        var font = configuration.normalTitleFont
        let margin = configuration.segmentTitleMargin
        var titleColor = configuration.normalTitleColor
        
        for (i, title) in titles.enumerated() {
            let labelX = (titleLabels.last?.frame.maxX ?? 0)
            let labelY = (bounds.maxY - font.lineHeight) / 2
            let width = labelSizeToFit(title, font: font) + margin * 2
            let labelFrame = CGRect(x: labelX, y: labelY , width: width, height: font.lineHeight)
            
            if i == configuration.segmentSelectIndex {
                selectIndex = i
                titleColor = configuration.selectedTitleColor
                font = configuration.selectedTitleFont
                setupIndicator(labelFrame)
            } else {
                titleColor = configuration.normalTitleColor
                font = configuration.normalTitleFont
            }
            
            setupTitleLabel(title, font: font, index: i, color: titleColor, frame: labelFrame)
        }
        
        scrollView.contentSize.width = titleLabels.last!.frame.maxX
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(VGSegment.handleSegmentTap))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    fileprivate func cleanSegemtn() {
        titleLabels.removeAll()
        scrollView.subviews.forEach { $0.removeFromSuperview() }
    }
}
