//
//  DuanZiModel.swift
//  happySwift
//
//  Created by tmp on 16/3/18.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit
import MJExtension

class DuanZiModel: NSObject {
    
    var message: String?

    var data: DataModel?
    
}
class DataModel: NSObject {

    var has_more: Bool = false

    var min_time: Int = 0

    var data: [DataDataModel]?

    var max_time: Int = 0

    var tip: String?

    
   func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return ["data" : DataDataModel()]
    }
}

class DataDataModel: NSObject {

    var group: Data2GroupModel?

    var online_time: Int = 0

    var type: Int = 0

    var comments: [Data2Comments]?

    var display_time: Int = 0

    func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return ["comments" : Data2Comments()]
    }
}

class Data2GroupModel: NSObject {

    var allow_dislike: Bool = false

    var share_type: Int = 0

    var id: Int = 0

    var user_bury: Int = 0

    var quick_comment: Bool = false

    var neihan_hot_end_time: String?

    var bury_count: Int = 0

    var text: String?

    var neihan_hot_start_time: String?

    var label: Int = 0

    var share_count: Int = 0

    var category_visible: Bool = false

    var has_comments: Int = 0

    var type: Int = 0

    var is_neihan_hot: Bool = false

    var user_favorite: Int = 0

    var user_digg: Int = 0

    var user: Data2GroupUserModel?

    var create_time: Int = 0

    var category_type: Int = 0

    var category_name: String?

    var dislike_reason: [Data2GroupDislike_ReasonModel]?

    var favorite_count: Int = 0

    var is_can_share: Int = 0

    var id_str: String?

    var comment_count: Int = 0

    var status_desc: String?

    var status: Int = 0

    var digg_count: Int = 0

    var neihan_hot_link: Data2GroupNeihan_Hot_LinkModel?

    var activity: Data2GroupActivityModel?

    var content: String?

    var user_repin: Int = 0

    var is_anonymous: Bool = false

    var group_id: Int = 0

    var go_detail_count: Int = 0

    var share_url: String?

    var category_id: Int = 0

    var media_type: Int = 0

    var online_time: Int = 0

    var repin_count: Int = 0

    var has_hot_comments: Int = 0
    
    func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return ["dislike_reason" : Data2GroupDislike_ReasonModel()]
    }
}

class Data2GroupActivityModel: NSObject {

}

class Data2GroupUserModel: NSObject {

    var user_verified: Bool = false

    var ugc_count: Int = 0

    var is_following: Bool = false

    var followers: Int = 0

    var user_id: Int = 0

    var followings: Int = 0

    var name: String?

    var avatar_url: String?

}

class Data2GroupNeihan_Hot_LinkModel: NSObject {

}

class Data2GroupDislike_ReasonModel: NSObject {

    var type: Int = 0

    var id: Int = 0

    var title: String?

}

class Data2Comments: NSObject {

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
        
        return ["description1" : "description"]
    }
}

