//
//  FirstViewController.swift
//  TestAddObject
//
//  Created by ys on 15/12/31.
//  Copyright © 2015年 ys. All rights reserved.
//

import UIKit

class FirstViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "全部添加"
        self.tableView.backgroundColor = UIColor.redColor()
    }
    
    override func addObject() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            for var i = 0; i < 10000; i++ {
                let string: String = "\(i)"
                self.dataArray.addObject(string)
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
                self.tableView.mj_footer.endRefreshing()
                self.tableView.mj_header.endRefreshing()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            })
        }
    }

}
