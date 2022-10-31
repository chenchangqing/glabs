//
//  HeaderView.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

/// 头视图
class HeaderView: UITableViewHeaderFooterView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.text = "Select crypto"
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10.0)
            $0.bottom.equalToSuperview().offset(-12.0)
        }
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
    
}
