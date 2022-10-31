//
//  AddressCell.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class AddressCell: ItemCell {

    override func setupUI() {
        super.setupUI()
        // 增加控件
        containerView.addSubview(leftVerticalLineView)
        containerView.addSubview(rightVerticalLineView)
        containerView.addSubview(detailLabel)
        containerView.addSubview(adressImageView)
        containerView.addSubview(titleLabel)
        // 更新属性
        detailLabel.font = UIFont.systemFont(ofSize: 14.0)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
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
        detailLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20.0)
            $0.width.lessThanOrEqualTo(100.0)
        }
        adressImageView.snp.makeConstraints {
            $0.size.equalTo(22.0)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(detailLabel.snp.leading).offset(-10.0)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10.0)
            $0.centerY.equalToSuperview()
            $0.trailing.lessThanOrEqualTo(adressImageView.snp.leading).offset(-10.0)
        }
    }
}
