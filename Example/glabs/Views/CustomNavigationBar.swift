//
//  CustomNavigationBar.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit

protocol CustomNavigationBarDelegate: AnyObject {
    
    func customNavigationBar(_ view: CustomNavigationBar, tapRightButton sender: UIButton)
}

/// 自定义导航
class CustomNavigationBar: UIView {
    
    weak var delegate: CustomNavigationBarDelegate?
    
    private lazy var rightButton: UIButton = {
        let view = UIButton(type: .custom)
        view.addTarget(self, action: #selector(tapRightButton(_:)), for: .touchUpInside)
        view.setBackgroundImage(UIImage(named: "menu"), for: .normal)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
     
        addSubview(rightButton)
        rightButton.snp.makeConstraints {
            $0.size.equalTo(40.0)
            $0.trailing.equalToSuperview().offset(-10.0)
            $0.bottom.equalToSuperview().offset(-5.0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let shadowPath = UIBezierPath(rect: bounds)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        layer.shadowOpacity = 0.1
        layer.shadowPath = shadowPath.cgPath
    }
    
    @objc private func tapRightButton(_ sender: UIButton) {
        delegate?.customNavigationBar(self, tapRightButton: sender)
    }
}
