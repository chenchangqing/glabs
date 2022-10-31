//
//  MetamasklastCell.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class MetamasklastCell: ItemCell {

    override func setupUI() {
        super.setupUI()
        // 增加控件
        contentView.addSubview(whiteLineView)
        containerView.addSubview(detailLabel)
        containerView.addSubview(titleContainer)
        titleContainer.addSubview(titleLabel)
        // 更新属性
        containerView.layer.cornerRadius = 3.0
        if #available(iOS 11.0, *) {
            containerView.layer.maskedCorners = [
                .layerMaxXMaxYCorner, .layerMinXMaxYCorner
            ]
        } else {
            // Fallback on earlier versions
        }
        containerView.layer.masksToBounds = true
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = kItemCellBorderColor.cgColor
        titleLabel.textColor = .black
        detailLabel.textColor = kItemCellTextColor
        // 设置约束
        whiteLineView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(11.0)
            $0.height.equalTo(1.0)
        }
        titleContainer.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10.0)
            $0.trailing.lessThanOrEqualTo(detailLabel.snp.leading).offset(-10.0)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(5.0)
            $0.top.bottom.equalToSuperview().inset(3.0)
        }
        detailLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10.0)
            $0.width.lessThanOrEqualTo(100.0)
        }
    }
}
