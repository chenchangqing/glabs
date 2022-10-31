//
//  CustomTableViewAdapter.swift
//  glabs_Example
//
//  Created by 陈长青 on 2022/10/31.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class CustomTableViewAdapter: NSObject {
    weak var viewModel: ViewModel?
}

extension CustomTableViewAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            fatalError("viewModel is nil")
        }
        let section = viewModel.sections[indexPath.section]
        let item = section.items[indexPath.row]
        switch item.style {
        case .crypto:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: kCryptoCellKey) as? CryptoCell else {
                fatalError("CryptoCell is not register")
            }
            cell.configure(item: item)
            cell.configure(isShowAll: section.isShowAll)
            return cell
        case .network:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: kNetworkCellKey) as? NetworkCell else {
                fatalError("NetworkCell is not register")
            }
            cell.configure(item: item)
            cell.configure(isShowAll: section.isShowAll)
            return cell
        case .withdraw:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: kWithdrawCellKey) as? WithdrawCell else {
                fatalError("WithdrawCell is not register")
            }
            cell.configure(item: item)
            cell.configure(isShowAll: section.isShowAll)
            return cell
        case .address:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: kAddressCellKey) as? AddressCell else {
                fatalError("AddressCell is not register")
            }
            cell.configure(item: item)
            return cell
        case .metamask:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: kMetamaskCellKey) as? MetamaskCell else {
                fatalError("MetamaskCell is not register")
            }
            cell.configure(item: item)
            return cell
        case .metamasklast:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: kMetamasklastCellKey) as? MetamasklastCell else {
                fatalError("MetamasklastCell is not register")
            }
            cell.configure(item: item)
            return cell
        }
    }
}

extension CustomTableViewAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {
            fatalError("viewModel is nil")
        }
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row == 0 {
            viewModel.toggle(section: indexPath.section)
            tableView.reloadData()
        } else if indexPath.section == 2, indexPath.row > 1 {
            PopView().show()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: kHeaderViewKey) as? HeaderView else {
            fatalError("HeaderView is not register")
        }
        guard let viewModel = viewModel else {
            fatalError("viewModel is nil")
        }
        let section = viewModel.sections[section]
        headerView.configure(title: section.title)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kItemCellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kHeaderViewHeight
    }
}
