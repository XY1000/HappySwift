//
//  NetService.swift
//  happySwift
//
//  Created by tmp on 16/3/17.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit
import Alamofire


enum content_typle : NSInteger{
    
    case Duanzi = -102
    case Video = -104
    
}

class NetService: NSObject {

    static let shareManger = NetService()
    private override init() {}//禁止创建
    
    //段子
    func duZiNet(typle:content_typle,time:NSString,success:(AnyObject)->Void,fail:(fail:NSError)->Void){
        
        
        
        let param = ["content_type" : "-102","iid" : "3207398618","idfa" : "idfa","version_code" : "4.4.2","device_type" : "iPhone%%205%%20(Global)","aid" : "7","os_version" : "9.0.2","screen_width" : "640","vid" : "A71945F4-10DB-49E0-977F-B90A896F483E","device_id" :"6741877917","os_api" : "18","app_name" : "joke_essay","device_platform" : "iphone","ac" : "WIFI","openudid" : "3d360c364f212291b31eb361cca4152cd43ca088","channel" : "App%%20Store","count" : "30","essence" : "1","message_cursor" : "0","min_time" : "1447046085","mpic" : "1"]
        
        
        Alamofire.request(.GET, "http://ic.snssdk.com/neihan/stream/mix/v1/", parameters:param).responseJSON { (Response) -> Void in
            
            
            switch Response.result {
                
                
            case .Success:
                
                let model = DuanZiModel()
                model.mj_setKeyValues(Response.result.value)
                
                
                success(model)
                
            case .Failure(let error):
                fail(fail: error)
                
            }
            
        }
        
    }
    //视频详情
    func VideoDetailNet(groupId : NSString , offset:NSString ,success:(AnyObject)->Void,fail:(fail:NSError)->Void) {
        
     
        
        let param = ["iid" : "3207398618","idfa" : "idfa","version_code" : "4.4.2","device_type" : "iPhone%%205%%20(Global)","aid" : "7","os_version" : "9.0.2","screen_width" : "640","vid" : "A71945F4-10DB-49E0-977F-B90A896F483E","device_id" :"6741877917","os_api" : "18","app_name" : "joke_essay","device_platform" : "iphone","ac" : "WIFI","openudid" : "3d360c364f212291b31eb361cca4152cd43ca088","channel" : "App%%20Store","count" : "20","group_id":"6103305438","offset":"0","sort":"hot","tag":"joke"]
        
        Alamofire.request(.GET, kVideoDetail,parameters:param).responseJSON { (Response) -> Void in
            
            switch Response.result {
                
                
            case .Success:
              
                
                let model = VideoDetailModel()
                
                model.mj_setKeyValues(Response.result.value)
                
                success(model)
                
                
            case .Failure(let error):
                fail(fail: error)
                
            }
            
            
        }
        
    }
    
}
