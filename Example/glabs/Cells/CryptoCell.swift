//
//  CryptoCell.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class CryptoCell: ItemCell {

    override func setupUI() {
        super.setupUI()
        // 增加控件
        containerView.addSubview(dropDownImageView)
        containerView.addSubview(usdcImageView)
        containerView.addSubview(titleLabel)
        // 更新属性
        containerView.layer.cornerRadius = 3.0
        containerView.layer.masksToBounds = true
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = kItemCellBorderColor.cgColor
        // 设置约束
        dropDownImageView.snp.makeConstraints {
            $0.size.equalTo(16.0)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10.0)
        }
        usdcImageView.snp.makeConstraints {
            $0.size.equalTo(21.0)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10.0)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(usdcImageView.snp.trailing).offset(10.0)
            $0.centerY.equalToSuperview()
            $0.trailing.lessThanOrEqualTo(dropDownImageView.snp.leading).offset(-10.0)
        }
    }
}
