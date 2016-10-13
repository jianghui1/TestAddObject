//
//  SecondViewController.swift
//  TestAddObject
//
//  Created by ys on 15/12/31.
//  Copyright © 2015年 ys. All rights reserved.
//

import UIKit

class SecondViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "单独添加"
        self.tableView.backgroundColor = UIColor.yellowColor()
        self.tableView.rowHeight = 44
    }
    
    
    override func addObject() {
        self.tableView.mj_header.endRefreshing()
        self.tableView.mj_footer.endRefreshing()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        let allCount: Int = 10000
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            for var i = 0; i < allCount; i++ {
                let string: String = "\(i)"
                self.dataArray.addObject(string)
                let count: CGFloat = self.tableView.frame.size.height / self.tableView.rowHeight
                if i < Int(count) + 1 || i == allCount - 1 {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.tableView.reloadData()
                    })
                }
            }
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                self.tableView.reloadData()
//            })
        }
    }
    
}
