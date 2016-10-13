//
//  ViewController.swift
//  TestAddObject
//
//  Created by ys on 15/12/31.
//  Copyright © 2015年 ys. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView: UITableView = UITableView()
    let dataArray: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "全部添加"
        
        self.tableView.frame = self.view.frame
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        self.view.addSubview(self.tableView)
        
        self.addRefresh()
        
        // 添加按钮
        let allButton: UIButton = UIButton(type: UIButtonType.System)
        allButton.frame = CGRectMake(100, 100, 100, 30)
        allButton.setTitle("全部添加", forState: UIControlState.Normal)
        allButton.addTarget(self, action: "allButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(allButton)
        
        let oneButton: UIButton = UIButton(type: UIButtonType.System)
        oneButton.frame = CGRectMake(100, 200, 100, 30)
        oneButton.setTitle("单独添加", forState: UIControlState.Normal)
        oneButton.addTarget(self, action: "oneButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(oneButton)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cellId")!
        
        if self.dataArray.count != 0 {
            cell.textLabel?.text = "\(indexPath.row)"
        }
        return cell
    }
    
    func addRefresh() {
        let header: MJRefreshGifHeader = MJRefreshGifHeader(refreshingTarget: self, refreshingAction: "headerRefresh")
        self.tableView.mj_header = header
        
        let footer: MJRefreshAutoGifFooter = MJRefreshAutoGifFooter(refreshingTarget: self, refreshingAction: "footerRefresh")
        self.tableView.mj_footer = footer
    }
    
    func headerRefresh() {
        self.dataArray.removeAllObjects()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        self.addObject()
    }
    func footerRefresh() {
//        self.addObject()
    }
    
    func addObject() {
        // 方法在子类中写
    }
    
    func allButtonAction() {
        self.navigationController?.pushViewController(FirstViewController(), animated: true)
    }
    
    func oneButtonAction() {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

