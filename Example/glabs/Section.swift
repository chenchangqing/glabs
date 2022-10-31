//
//  Section.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

struct Section {
    struct Item {
        enum Style {
            case crypto
            case network
            case withdraw
            case address
            case metamask
            case metamasklast
        }
        let style: Style
        let title: String
        let detail: String?
    }
    let title: String
    let isShowAll: Bool
    let items: [Item]
}
