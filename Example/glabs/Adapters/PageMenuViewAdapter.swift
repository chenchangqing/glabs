//
//  PageMenuViewAdapter.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/11/1.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class PageMenuViewAdapter: NSObject {
    weak var scrollView: UIScrollView?
}

extension PageMenuViewAdapter: PageMenuViewDelegate {
    
    func pageMenuView(_ view: PageMenuView, changedIndex index: Int) {
        scrollView?.setContentOffset(.init(x: kPageScrollViewSize.width*CGFloat(index), y: 0.0), animated: true)
    }
}
