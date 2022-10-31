//
//  PopView.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/11/1.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class PopView: UIView {
    
    private lazy var closeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "close")
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.text = "Confirm Withdrawal"
        label.textColor = .black
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = kItemCellBorderColor
        return view
    }()
    
    private lazy var subTitleContainer: UIView = {
        let view = UIView()
        view.backgroundColor = kItemCellTitleContainerColor
        view.layer.cornerRadius = 4.0
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = kItemCellTextColor
        label.textAlignment = .center
        label.text = "Verify with Email"
        return label
    }()
    
    private lazy var sendTopView: UIView = {
        let view = UIView()
        view.layer.borderColor = kItemCellBorderColor.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var otpLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = kItemCellTextColor
        label.textAlignment = .center
        label.backgroundColor = .white
        label.text = "OTP"
        return label
    }()
    
    private lazy var sendTopLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12.0)
        label.textAlignment = .right
        label.text = "Send Top"
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Confirm", for: .normal)
        button.backgroundColor = kConfirmBackgroundColor
        button.layer.cornerRadius = 4.0
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        return button
    }()
    
    private lazy var backgroundButton: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(tapBackgroundButton(_:)), for: .touchUpInside)
        button.backgroundColor = .black.withAlphaComponent(0.3)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 4.0
        if #available(iOS 11.0, *) {
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
        
        addSubview(closeImageView)
        addSubview(titleLabel)
        addSubview(lineView)
        addSubview(subTitleContainer)
        subTitleContainer.addSubview(subTitleLabel)
        addSubview(sendTopView)
        addSubview(otpLabel)
        addSubview(sendTopLabel)
        addSubview(confirmButton)
        
        closeImageView.snp.makeConstraints {
            $0.size.equalTo(20.0)
            $0.trailing.equalToSuperview().offset(-15.0)
            $0.top.equalToSuperview().offset(10.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(45.0)
        }
        
        lineView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10.0)
            $0.top.equalTo(titleLabel.snp.bottom).offset(40.0)
            $0.height.equalTo(1.0)
        }
        
        subTitleContainer.snp.makeConstraints {
            $0.center.equalTo(lineView)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(5.0)
            $0.top.bottom.equalToSuperview().inset(3.0)
        }
        
        sendTopView.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(20.0)
            $0.leading.trailing.equalToSuperview().inset(10.0)
            $0.height.equalTo(40.0)
        }
        
        otpLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15.0)
            $0.centerY.equalTo(sendTopView.snp.top)
            $0.width.equalTo(30.0)
        }
        
        sendTopLabel.snp.makeConstraints {
            $0.trailing.equalTo(sendTopView.snp.trailing).offset(-10.0)
            $0.centerY.equalTo(sendTopView)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(sendTopView.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview().inset(10.0)
            $0.height.equalTo(40.0)
        }
    }
    
    func show() {
        guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else {
            return
        }
        window.addSubview(backgroundButton)
        window.addSubview(self)
        backgroundButton.frame = window.bounds
        backgroundButton.alpha = 0.0
        frame = CGRect(origin: .init(x: 0.0, y: window.bounds.size.height),
                       size: kPopViewSize)
        UIView.animate(withDuration: 0.3) {
            self.transform = .init(translationX: 0.0, y: -kPopViewSize.height)
            self.backgroundButton.alpha = 1.0
        }
    }
    
    @objc private func tapBackgroundButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.transform = .identity
            self.backgroundButton.alpha = 0.0
        } completion: { _ in
            self.removeFromSuperview()
            self.backgroundButton.removeFromSuperview()
        }

    }
}
