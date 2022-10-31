//
//  CustomTableView.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

/// 自定义列表（支持下拉）
class CustomTableView: UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentInset = .init(top: 0.0, left: 0.0, bottom: kSafeAreaBottomHeight+5.0, right: 0.0)
        backgroundColor = .clear
        register(CryptoCell.classForCoder(), forCellReuseIdentifier: kCryptoCellKey)
        register(NetworkCell.classForCoder(), forCellReuseIdentifier: kNetworkCellKey)
        register(WithdrawCell.classForCoder(), forCellReuseIdentifier: kWithdrawCellKey)
        register(AddressCell.classForCoder(), forCellReuseIdentifier: kAddressCellKey)
        register(MetamaskCell.classForCoder(), forCellReuseIdentifier: kMetamaskCellKey)
        register(MetamasklastCell.classForCoder(), forCellReuseIdentifier: kMetamasklastCellKey)
        register(HeaderView.classForCoder(), forHeaderFooterViewReuseIdentifier: kHeaderViewKey)
        separatorStyle = .none
        if #available(iOS 15.0, *) {
            sectionHeaderTopPadding = 0.0
        } else {
            // Fallback on earlier versions
        }
    }
}
