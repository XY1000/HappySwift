//
//  VideoDetailModel.swift
//  happySwift
//
//  Created by tmp on 16/3/18.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

class VideoDetailModel: NSObject {

    
    var has_more: Bool = false

    var message: String?

    var group_id: Int = 0

    var data: VideoDataModel?

    var new_comment: Bool = false

    var total_number: Int = 0
    
    
}
class VideoDataModel: NSObject {

    var top_comments: [VideoDataTop_CommentsModel]?

    var recent_comments: [VideoDataRecent_CommentsModel]?
    func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        
        return ["top_comments":VideoDataTop_CommentsModel(),"recent_comments":VideoDataRecent_CommentsModel()]
    }
}

class VideoDataTop_CommentsModel: NSObject {

    var user_name: String?

    var user_profile_url: String?

    var status: Int = 0

    var is_digg: Int = 0

    var group_id: Int = 0

    var user_bury: Int = 0

    var user_id: Int = 0

    var create_time: Int = 0

    var digg_count: Int = 0

    var user_verified: Bool = false

    var bury_count: Int = 0

    var avatar_url: String?

    var platform_id: String?

    var id: Int = 0

    var comment_id: Int = 0

    var platform: String?

    var user_digg: Int = 0

    var user_profile_image_url: String?

    var text: String?

    var description1: String?

    func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        
        return ["description1":"description"]
    }
}

class VideoDataRecent_CommentsModel: NSObject {

    var user_name: String?

    var user_profile_url: String?

    var status: Int = 0

    var is_digg: Int = 0

    var group_id: Int = 0

    var user_bury: Int = 0

    var user_id: Int = 0

    var create_time: Int = 0

    var digg_count: Int = 0

    var user_verified: Bool = false

    var bury_count: Int = 0

    var avatar_url: String?

    var platform_id: String?

    var id: Int = 0

    var comment_id: Int = 0

    var platform: String?

    var user_digg: Int = 0

    var user_profile_image_url: String?

    var text: String?

    var description1: String?
    func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        
        return ["description1":"description"]
    }
}

