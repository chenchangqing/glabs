//
//  MetamaskCell.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class MetamaskCell: ItemCell {
    
    override func setupUI() {
        super.setupUI()
        // 增加控件
        containerView.addSubview(leftVerticalLineView)
        containerView.addSubview(rightVerticalLineView)
        containerView.addSubview(detailLabel)
        containerView.addSubview(titleContainer)
        titleContainer.addSubview(titleLabel)
        // 更新属性
        titleLabel.textColor = .black
        detailLabel.textColor = kItemCellTextColor
        // 设置约束
        leftVerticalLineView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(1.0)
            $0.top.bottom.equalToSuperview()
        }
        rightVerticalLineView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.width.equalTo(1.0)
            $0.top.bottom.equalToSuperview()
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
