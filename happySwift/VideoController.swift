//
//  VideoController.swift
//  happySwift
//
//  Created by tmp on 16/3/17.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit
import MJRefresh
import SVProgressHUD
import SDWebImage
class VideoController: UIViewController,UITableViewDelegate,UITableViewDataSource {

     var model : VideoDetailModel = VideoDetailModel()
    var rowNumber : NSArray!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
       self.initView()

        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if self.rowNumber == nil {
            
            self.RefreshData()
            
            
        }
    }
    
    
    //MARK:初始化视图
    func initView() {
        
        self.tableView.mj_header = MJRefreshHeader(refreshingTarget: self, refreshingAction: "RefreshData")
        
        self.tableView.mj_footer = MJRefreshFooter(refreshingTarget: self, refreshingAction: "getMoreData")
        
        self.tableView.registerClass(VideoCell.self, forCellReuseIdentifier: "cell")
        
        self.navigationItem.title = "视频"
    }
    
    //Mark:刷新
    func RefreshData() {
        
        SVProgressHUD.showWithStatus("加载中")
        
        NetService.shareManger.VideoDetailNet("", offset: "", success: { (success) -> Void in
            
            SVProgressHUD.dismiss()
            self.model = success as! VideoDetailModel
            self.rowNumber = self.model.data?.recent_comments
            self.tableView.reloadData()
            
            }) { (fail) -> Void in
                
                
//                SVProgressHUD.showErrorWithStatus(fail.userInfo[])
                
                print(fail)
                
        }
    }
    //Mark:加载更多
    func getMoreData() {
        
        print("加载更多")
        
    }
    
    
    //MARK: UITableViewDelegate/Datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 1;
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if self.rowNumber != nil {
            
            return self.rowNumber.count
            
        }else {
            
            return 0
        }
        
        
    }
    
    
      func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        let  cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! VideoCell
        
        
        var allArr = NSMutableArray()
        
        for dic in self.rowNumber {
            
            
            let model = VideoDataRecent_CommentsModel()
            
            model.mj_setKeyValues(dic)
            allArr.addObject(model)
        }
      
        let rencentModel = allArr[indexPath.section] as! VideoDataRecent_CommentsModel
        
        cell.userNameLb.text = rencentModel.user_name
        
        
        return cell;
    }


    

}
