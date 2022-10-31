//
//  PageMenuView.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit

protocol PageMenuViewDelegate: AnyObject {
    func pageMenuView(_ view: PageMenuView, changedIndex index: Int)
}

/// 页面菜单
class PageMenuView: UIView {
    
    weak var delegate: PageMenuViewDelegate?
    
    private let titles = ["OVERVIEW", "WITHDRAW", "ADDRESS BOOK"]
    
    var currentIndex: Int {
        didSet {
            updateCurrentIndex(isFirst: false, animate: true)
        }
    }
    
    private var currentLabel: UILabel? {
        if currentIndex < titleStackView.arrangedSubviews.count {
            return titleStackView.arrangedSubviews[currentIndex] as? UILabel
        } else {
            return nil
        }
    }
    
    private var titleLabels: [UILabel] {
        titleStackView.arrangedSubviews.compactMap { $0 as? UILabel }
    }
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 20.0
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private lazy var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 2.0
        view.layer.masksToBounds = true
        return view
    }()
    
    init(currentIndex: Int) {
        self.currentIndex = currentIndex
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        addSubview(titleStackView)
        addSubview(indicatorView)
        
        titles.enumerated().forEach {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14.0)
            label.tag = $0.0
            label.text = $0.1
            label.isUserInteractionEnabled = true
            titleStackView.addArrangedSubview(label)
            
            let tapGes = UITapGestureRecognizer()
            tapGes.addTarget(self, action: #selector(tapTitleLabel(_:)))
            label.addGestureRecognizer(tapGes)
        }
        
        titleStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10.0)
            $0.top.bottom.equalToSuperview()
        }
        
        updateCurrentIndex(isFirst: true, animate: false)
    }
    
    private func updateCurrentIndex(isFirst: Bool, animate: Bool) {
        
        guard let currentLabel = currentLabel else {
            return
        }
        
        titleLabels.forEach {
            if $0 != currentLabel {
                $0.textColor = kPageMenuViewNorTextColor
            } else {
                $0.textColor = kPageMenuViewSelTextColor
            }
        }
        
        if isFirst {

            indicatorView.snp.makeConstraints {
                $0.width.equalTo(30.0)
                $0.height.equalTo(4.0)
                $0.bottom.equalToSuperview()
                $0.centerX.equalTo(currentLabel.snp.centerX)
            }
        } else {
            
            indicatorView.snp.remakeConstraints {
                $0.width.equalTo(30.0)
                $0.height.equalTo(4.0)
                $0.bottom.equalToSuperview()
                $0.centerX.equalTo(currentLabel.snp.centerX)
            }
        }
        
        if animate {
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
        } else {
            layoutIfNeeded()
        }
    }
    
    @objc private func tapTitleLabel(_ sender: UITapGestureRecognizer) {
        
        guard let label = sender.view as? UILabel else {
            return
        }
        
        self.currentIndex = label.tag
        delegate?.pageMenuView(self, changedIndex: label.tag)
    }

}
