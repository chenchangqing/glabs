//
//  ItemCell.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

/// 被继承的Cell
class ItemCell: UITableViewCell {
    
    /// 容器
    private(set) lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    /// 标题容器
    private(set) lazy var titleContainer: UIView = {
        let view = UIView()
        view.backgroundColor = kItemCellTitleContainerColor
        view.layer.cornerRadius = 3.0
        view.layer.masksToBounds = true
        return view
    }()
    
    /// 标题文字（左）
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.text = "PolygonPolygonPolygonPolygonPolygonPolygon"
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    /// 详细文字（右）
    private(set) lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingMiddle
        label.text = "TMJKLJKLJJLJKLJKLJLfsdfsdfsfds"
        return label
    }()
    
    /// 展开Icon
    private(set) lazy var dropDownImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "drop_down")
        return imageView
    }()
    
    /// 地址Icon
    private(set) lazy var adressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "address_book")
        return imageView
    }()
    
    /// 价格Icon
    private(set) lazy var usdcImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "usdc")
        return imageView
    }()
    
    /// 左边竖线
    private(set) lazy var leftVerticalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = kItemCellBorderColor
        return view
    }()
    
    /// 右边竖线
    private(set) lazy var rightVerticalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = kItemCellBorderColor
        return view
    }()
    
    /// 白色横线
    private(set) lazy var whiteLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10.0)
            $0.top.bottom.equalToSuperview()
        }
    }
    
    func configure(item: Section.Item) {
        titleLabel.text = item.title
        detailLabel.text = item.detail
    }
    
    func configure(isShowAll: Bool) {
        
        if #available(iOS 11.0, *) {
            if isShowAll {
                containerView.layer.maskedCorners = [
                    .layerMinXMinYCorner, .layerMaxXMinYCorner
                ]
                UIView.animate(withDuration: 0.3) {
                    self.dropDownImageView.transform = .init(rotationAngle: .pi)
                }
            } else {
                containerView.layer.maskedCorners = [
                    .layerMinXMinYCorner, .layerMaxXMinYCorner,
                    .layerMinXMaxYCorner, .layerMaxXMaxYCorner
                ]
                UIView.animate(withDuration: 0.3) {
                    self.dropDownImageView.transform = .identity
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }

}
