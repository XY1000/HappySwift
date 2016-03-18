//
//  VideoCell.swift
//  happySwift
//
//  Created by tmp on 16/3/18.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class VideoCell: UITableViewCell,AVPlayerViewControllerDelegate {
    
    private let standAVC = AVPlayerViewController()
    
    var vc : AVPlayerViewController!
    
    //MARK:播放按钮
    lazy var playBtn : UIButton = {
        
        var btn = UIButton()
        
        btn.setImage(UIImage(named: "play"), forState: UIControlState.Normal)
        btn.alpha = 0.7
        
        self.videoIV.addSubview(btn)
        btn.snp_makeConstraints(closure: { (make) -> Void in
            
            make.size.equalTo(CGSizeMake(50, 50))
            make.center.equalTo(0)
        })
        
        btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return btn
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //判断当前cell是否有播放，如果有则删除
        if self.standAVC.view.superview == self.videoIV {
            
            self.standAVC.view.removeFromSuperview()
            self.standAVC.player = nil
            
        }
        
        
    }
    //MARK:视频
   lazy var videoIV : UIImageView = {
        
       var imgView = UIImageView()
    
        self.contentView.addSubview(imgView)
    
        imgView.snp_makeConstraints(closure: { (make) -> Void in
            
            make.width.equalTo(kWindowW*0.9);
            make.top.equalTo(self.titleLb.snp_bottom).offset(5);
            make.bottom.equalTo(self.commentLb.snp_top).offset(5);
            make.centerX.equalTo(0);
            make.centerY.equalTo(self.snp_centerY).offset(10);
            make.height.equalTo(150);
            
        })
    
    
        return imgView
    }()
    //MARK:播放次数
    lazy var playCountLb : UILabel = {
        
        var lb = UILabel()
        
        self.playView.addSubview(lb)
        
        lb.font = UIFont.systemFontOfSize(12)
        lb.textColor = UIColor.orangeColor()
        lb.textAlignment = NSTextAlignment.Right
        
        lb.snp_makeConstraints(closure: { (make) -> Void in
            
            make.left.equalTo(5)
            make.centerY.equalTo(0)
            make.width.lessThanOrEqualTo(100)
            make.width.greaterThanOrEqualTo(10)
            
        })
        let lb1 = UILabel()
        
        self.playView.addSubview(lb1)
        lb1.text = "次播放"
        lb1.font = UIFont.systemFontOfSize(12)
        lb1.textColor = UIColor.whiteColor()
        
        lb1.snp_makeConstraints(closure: { (make) -> Void in
            
            make.centerY.equalTo(0)
            make.left.equalTo(lb.snp_right)
            make.width.equalTo(50)
            
        })

        
        
        return lb
    }()
    //MARK:时长
    lazy var durationLb : UILabel = {
        
        var duraLb = UILabel()
        duraLb.font = UIFont.systemFontOfSize(12)
        duraLb.textColor = UIColor.whiteColor()
        duraLb.textAlignment = NSTextAlignment.Right
        self.playView.addSubview(duraLb)
        
        duraLb.snp_makeConstraints(closure: { (make) -> Void in
            
            make.centerY.equalTo(0);
            make.width.equalTo(50);
            make.right.equalTo(-5);
            
            
        })
        
        return duraLb
    }()
    //MARK:显示时长和播放次数
    lazy var playView : UIView = {
        
        var view = UIView ()
        
        self.videoIV.addSubview(view)
        view.alpha = 0.5
        view.backgroundColor = UIColor.blackColor()
        
        view.snp_makeConstraints(closure: { (make) -> Void in
            
            
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(30)
        })
        
        return view
    }()
    //MARK:播放源
    lazy var  playSource : NSURL = {
        
        var url = NSURL()
        
        return url
    }()
    
    //MARK:用户头像
    lazy var userIcoIV :UIImageView = {
    
        let icon = UIImageView()
        
        icon.layer.bounds = CGRectMake(0, 0, 30, 30);
        icon.layer.position = CGPointMake(5, 5);
        icon.layer.anchorPoint = CGPointMake(0, 0);
        icon.layer.cornerRadius = icon.bounds.size.width / 2.0;
        icon.layer.masksToBounds = true;
        
        self.contentView.layer.addSublayer(icon.layer)
        
        self.contentView.addSubview(icon)
        
        return icon
    }()
    //Mark:用户名
    lazy var userNameLb : UILabel = {
        
        let name = UILabel()
        name.lineBreakMode =  NSLineBreakMode.ByTruncatingMiddle
        self.contentView.addSubview(name)
        name.font = UIFont.systemFontOfSize(12)
        name.textColor = UIColor.lightGrayColor()
        
        name.snp_makeConstraints(closure: { (make) -> Void in
            
            make.centerY.equalTo(self.userIcoIV.snp_centerY)
            make.left.equalTo(self.userIcoIV.snp_right)
            make.right.equalTo(5)
        })
        
        return name
    }()
    //MARK:标题
    lazy var titleLb : UILabel = {
        
        let title = UILabel()
        
        title.numberOfLines = 2
        title.lineBreakMode = NSLineBreakMode.ByTruncatingMiddle
        title.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(title)
        
        title.snp_makeConstraints(closure: { (make) -> Void in
            
            make.top.left.equalTo(self.userIcoIV.snp_bottom).offset(5)
            make.right.equalTo(-5)
            
        })
        return title
        
        
    }()
    //MARK:赞
    lazy var likeLb : UILabel = {
        let like = UILabel()
        
        let likeImg = UIImageView(image: UIImage(named: "digupicon_comment"))
        self.contentView.addSubview(likeImg)
        like.font = UIFont.systemFontOfSize(12)
        like.textColor = UIColor.lightGrayColor()
        self.contentView.addSubview(like)
        
        likeImg.snp_makeConstraints(closure: { (make) -> Void in
            
            make.left.equalTo(20)
            make.centerY.equalTo(like)
            make.size.equalTo(CGSizeMake(20, 20))
        })
        
        like.snp_makeConstraints(closure: { (make) -> Void in
            
            make.left.equalTo(likeImg.snp_right).offset(5)
            make.centerY.equalTo(self.dislikeLb)
            make.width.lessThanOrEqualTo(50)
            make.width.greaterThanOrEqualTo(10)
            
        })
        
        
        return like
    }()
    //MARK:不喜欢
    lazy var dislikeLb : UILabel = {
        let dislike = UILabel()
        
        let dis = UIImageView(image: UIImage(named: "digdownicon_textpage"))
        self.contentView.addSubview(dis)
        dislike.font = UIFont.systemFontOfSize(12)
        dislike.textColor = UIColor.lightGrayColor()
        self.contentView.addSubview(dislike)
        
        dis.snp_makeConstraints(closure: { (make) -> Void in
            
            make.size.equalTo(CGSizeMake(30, 30))
            make.right.equalTo(dislike.snp_left).offset(-5)
            make.bottom.equalTo(-2)
            
        })
        
        dislike.snp_makeConstraints(closure: { (make) -> Void in
            
            make.right.equalTo(self.snp_centerX).offset(-10)
            make.centerY.equalTo(dis)
            make.width.lessThanOrEqualTo(50)
            make.width.greaterThanOrEqualTo(10)
            
        })
        
        
        return dislike
    }()
    //MARK：评论
    lazy var commentLb : UILabel = {
        let comment = UILabel()
        
        let com = UIImageView(image: UIImage(named: "commenticon_textpage"))
        self.contentView.addSubview(com)
        com.snp_makeConstraints(closure: { (make) -> Void in
            
            make.bottom.equalTo(-2)
            make.left.equalTo(self.snp_centerX).offset(10)
            make.size.equalTo(CGSizeMake(30, 30))
            
        })
        
        
        comment.font = UIFont.systemFontOfSize(12)
        comment.textColor = UIColor.lightGrayColor()
        self.contentView.addSubview(comment)
        comment.snp_makeConstraints(closure: { (make) -> Void in
            
            make.centerY.equalTo(com.snp_centerY)
            make.left.equalTo(com.snp_right).offset(5)
            make.width.lessThanOrEqualTo(30)
            make.width.greaterThanOrEqualTo(10)
        })
        
        
        return comment
    }()
    //MARK:转发
    lazy var shareLb : UILabel = {
        let share = UILabel()
        share.font = UIFont.systemFontOfSize(12)
        share.textColor = UIColor.lightGrayColor()
        
        let sh = UIImageView(image: UIImage(named: "moreicon_textpage"))
        self.contentView.addSubview(sh)
        sh.snp_makeConstraints(closure: { (make) -> Void in
            
            make.size.equalTo(CGSizeMake(30,30));
            make.bottom.equalTo(-2);
            make.right.equalTo(share.snp_left).offset(5);
        })
        
        self.contentView.addSubview(share)
        
        share.snp_makeConstraints(closure: { (make) -> Void in
            
            make.centerY.equalTo(sh.snp_centerY);
            make.right.equalTo(-25);
            make.width.lessThanOrEqualTo(50);
            make.width.greaterThanOrEqualTo(10);
            
        })
        
        
        return share
    }()
    
    
    //MARK:按钮点击
    func btnClick(sender:UIButton) {
        
        let player = AVPlayer(URL: self.playSource)
        
        self.vc = self.standAVC
        
        self.vc.player = player
        
        if sender.selected {
            
            self.vc.player?.play()
        }else {
            self.vc.player?.pause()
        }
        
        self.videoIV.addSubview(self.vc.view)
    
        self.vc.view.snp_makeConstraints { (make) -> Void in
            
            make.edges.equalTo(0);
            
        }
        
        self.vc.delegate = self
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
