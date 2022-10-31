//
//  ViewModel.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    var sections: [Section] = [
        .init(title: "Select crypto", isShowAll: false, items: [
            .init(style: .crypto, title: "USDC", detail: nil)
        ]),
        .init(title: "Network", isShowAll: false, items: [
            .init(style: .network, title: "Polgon", detail: nil)
        ]),
        .init(title: "Withdraw to", isShowAll: true, items: [
            .init(style: .withdraw, title: "My Metamask", detail: "TMLJLKJDFKLFJFJ"),
            .init(style: .address, title: "Addresses", detail: "Address Book"),
            .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
            .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
            .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
            .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
            .init(style: .metamasklast, title: "My Metamask,My Metamask,My Metamask", detail: "0xfksldjfklsdjkfl")
        ])
    ]
    
    func toggle(section: Int) {
        switch section {
        case 0:
            toggleCrypto()
        case 1:
            toggleNetwork()
        case 2:
            toggleWithdraw()
        default:
            break
        }
    }
    
    private func toggleCrypto() {
        sections = sections.enumerated().map {
            if $0.offset == 0 {
                if $0.element.isShowAll {
                    return .init(title: "Select crypto", isShowAll: false, items: [
                        .init(style: .crypto, title: "USDC", detail: nil)
                    ])
                } else {
                    return .init(title: "Select crypto", isShowAll: true, items: [
                        .init(style: .crypto, title: "USDC", detail: nil),
                        .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
                        .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
                        .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
                        .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
                        .init(style: .metamasklast, title: "My Metamask,My Metamask,My Metamask", detail: "0xfksldjfklsdjkfl")
                    ])
                }
            } else {
                return $0.element
            }
        }
    }
    
    private func toggleNetwork() {
        sections = sections.enumerated().map {
            if $0.offset == 1 {
                if $0.element.isShowAll {
                    return .init(title: "Network", isShowAll: false, items: [
                        .init(style: .network, title: "Polgon", detail: nil)
                    ])
                } else {
                    return .init(title: "Network", isShowAll: true, items: [
                        .init(style: .network, title: "Polgon", detail: nil),
                        .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
                        .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
                        .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
                        .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
                        .init(style: .metamasklast, title: "My Metamask,My Metamask,My Metamask", detail: "0xfksldjfklsdjkfl")
                    ])
                }
            } else {
                return $0.element
            }
        }
    }
    
    private func toggleWithdraw() {
        sections = sections.enumerated().map {
            if $0.offset == 2 {
                if $0.element.isShowAll {
                    return .init(title: "Withdraw to", isShowAll: false, items: [
                        .init(style: .withdraw, title: "My Metamask", detail: "TMLJLKJDFKLFJFJ")
                    ])
                } else {
                    return .init(title: "Withdraw to", isShowAll: true, items: [
                        .init(style: .withdraw, title: "My Metamask", detail: "TMLJLKJDFKLFJFJ"),
                        .init(style: .address, title: "Addresses", detail: "Address Book"),
                        .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
                        .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
                        .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
                        .init(style: .metamask, title: "My Metamask", detail: "0xfksldjfklsdjkfl"),
                        .init(style: .metamasklast, title: "My Metamask,My Metamask,My Metamask", detail: "0xfksldjfklsdjkfl")
                    ])
                }
            } else {
                return $0.element
            }
        }
    }
}
