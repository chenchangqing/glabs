//
//  Constants.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

/// 是否为iPhone X系列
var isPhoneX: Bool {
    if #available(iOS 11.0, *) {
        return (UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0.0) > CGFloat(0.0)
    } else {
        return false
    }
}

/// 状态栏高度
var kStatusBarHeight: CGFloat {
    return isPhoneX ? 44.0 : 20.0
}

/// 屏幕底部安全距离
var kSafeAreaBottomHeight: CGFloat {
    return isPhoneX ? 34.0 : 0.0
}

/// 导航栏高度
let kCustomNavigationBarHeight: CGFloat = 55.0
/// 菜单栏高度
let kPageMenuViewHeight: CGFloat = 50.0
/// 页面背景色
let kViewControllerBackgroundColor: UIColor = UIColor(red: 251.0/255.0, green: 251.0/255.0, blue: 251.0/255.0, alpha: 1.0)
/// 菜单指示器选中颜色
let kPageMenuViewSelTextColor: UIColor = UIColor.black
/// 菜单指示器未选中颜色
let kPageMenuViewNorTextColor: UIColor = UIColor(red: 96.0/255.0, green: 96.0/255.0, blue: 96.0/255.0, alpha: 1.0)
/// 单元格高度
let kItemCellHeight: CGFloat = 45.0
/// 单元格边颜色
let kItemCellBorderColor: UIColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)
/// 单元格文字颜色
let kItemCellTextColor: UIColor = UIColor(red: 96.0/255.0, green: 96.0/255.0, blue: 96.0/255.0, alpha: 1.0)
/// 单元格标题背景色
let kItemCellTitleContainerColor: UIColor = UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1.0)
/// 单元格复用Key
let kCryptoCellKey: String       = "CryptoCell"
let kNetworkCellKey: String      = "NetworkCell"
let kWithdrawCellKey: String     = "WithdrawCell"
let kAddressCellKey: String      = "AddressCell"
let kMetamaskCellKey: String     = "MetamaskCell"
let kMetamasklastCellKey: String = "MetamasklastCell"
let kHeaderViewKey: String       = "HeaderView"
/// 头视图高度
let kHeaderViewHeight: CGFloat = 50.0
/// 弹出视图大小
let kPopViewSize: CGSize = .init(width: UIScreen.main.bounds.size.width, height: 230.0+kSafeAreaBottomHeight)
/// 确认按钮背景色
let kConfirmBackgroundColor = UIColor(red: 248.0/255.0, green: 207.0/255.0, blue: 214.0/255.0, alpha: 1.0)
/// 滑动视图大小
let kPageScrollViewSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-kStatusBarHeight-kCustomNavigationBarHeight-kPageMenuViewHeight)
