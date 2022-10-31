//
//  PageScrollViewAdapter.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/11/1.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class PageScrollViewAdapter: NSObject {
    weak var pageMenuView: PageMenuView?
}

extension PageScrollViewAdapter: UIScrollViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if !decelerate {
            let offsetX: CGFloat = scrollView.contentOffset.x
            let index: Int = Int(offsetX / scrollView.bounds.size.width)
            pageMenuView?.currentIndex = index
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offsetX: CGFloat = scrollView.contentOffset.x
        let index: Int = Int(offsetX / scrollView.bounds.size.width)
        pageMenuView?.currentIndex = index
    }
}
