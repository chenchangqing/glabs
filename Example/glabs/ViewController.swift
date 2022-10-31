//
//  ViewController.swift
//  glabs
//
//  Created by chenchangqing on 10/31/2022.
//  Copyright (c) 2022 chenchangqing. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    /// 自定义导航
    private lazy var customNavigationBar: CustomNavigationBar = {
        let view = CustomNavigationBar()
        view.backgroundColor = .white
        return view
    }()
    
    /// 页面菜单
    private lazy var pageMenuView: PageMenuView = {
        let view = PageMenuView(currentIndex: 0)
        view.backgroundColor = .clear
        return view
    }()
    
    /// 页面菜单适配器
    private lazy var pageMenuViewAdapter: PageMenuViewAdapter = {
        let adapter = PageMenuViewAdapter()
        return adapter
    }()
    
    /// 滑动视图
    private lazy var pageScrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.contentSize = CGSize(width: kPageScrollViewSize.width*3.0, height: kPageScrollViewSize.height)
        view.isPagingEnabled = true
        return view
    }()
    
    /// 滑动视图适配器
    private lazy var pageScrollViewAdapter: PageScrollViewAdapter = {
        let adapter = PageScrollViewAdapter()
        return adapter
    }()
    
    /// 自定义列表
    private lazy var tableView: CustomTableView = {
        let tableView = CustomTableView(frame: .zero, style: .plain)
        return tableView
    }()
    
    /// 自定义列表适配器
    private lazy var tableViewAdapter: CustomTableViewAdapter = {
        let adapter = CustomTableViewAdapter()
        return adapter
    }()
    
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI() {
        
        tableView.dataSource = tableViewAdapter
        tableView.delegate = tableViewAdapter
        tableViewAdapter.viewModel = viewModel
        
        pageMenuView.delegate = pageMenuViewAdapter
        pageMenuViewAdapter.scrollView = pageScrollView
        
        pageScrollView.delegate = pageScrollViewAdapter
        pageScrollViewAdapter.pageMenuView = pageMenuView
        
        view.backgroundColor = kViewControllerBackgroundColor
        view.addSubview(customNavigationBar)
        view.insertSubview(pageMenuView, belowSubview: customNavigationBar)
        view.addSubview(pageScrollView)
        pageScrollView.addSubview(tableView)
        
        customNavigationBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(kStatusBarHeight)
            $0.height.equalTo(kCustomNavigationBarHeight)
        }
        pageMenuView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(customNavigationBar.snp.bottom)
            $0.height.equalTo(kPageMenuViewHeight)
        }
        pageScrollView.frame = CGRect(origin: .init(x: 0.0, y: UIScreen.main.bounds.height-kPageScrollViewSize.height), size: kPageScrollViewSize)
        tableView.frame = CGRect(origin: .zero, size: kPageScrollViewSize)
    }

}

