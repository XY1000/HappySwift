//
//  WelcomViewController.swift
//  happySwift
//
//  Created by tmp on 16/3/17.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit
import SnapKit
class WelcomViewController: UIViewController {

    
    var allImg : NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //接收图片
       self.allImg = welcomeModel.dataDemo()
        
       self.配置滚动视图()
        
    }

    func 配置滚动视图() {
        
        let scroll  = UIScrollView(frame:CGRectMake(0,0,kWindowW,kWindowH))
        
        scroll.pagingEnabled = true
        scroll.contentSize = CGSizeMake(CGFloat(self.allImg.count) * kWindowW, 0)
        scroll.showsHorizontalScrollIndicator = false
        scroll.bounces = false
        
        for var i = 0;i < self.allImg.count;i++ {
            
            let imageView = UIImageView(frame: CGRectMake(CGFloat(i) * kWindowW, 0, kWindowW, kWindowH))
            imageView.image = UIImage.init(named: self.allImg[i] as! String)
            imageView.userInteractionEnabled = true
            if i == (self.allImg.count - 1) {
                
                let btn = UIButton(type: UIButtonType.Custom)
                imageView.addSubview(btn)
                btn.backgroundColor = UIColor.clearColor()
                btn.snp_makeConstraints(closure: { (make) -> Void in
                    
                    make.centerX.equalTo(0)
                    make.bottom.equalTo(-20)
                    make.width.equalTo(250)
                    make.height.equalTo(50)
                    
                })
                btn.addTarget(self, action:"tapped" , forControlEvents:.TouchUpInside)
                
                
                
            }
            scroll.addSubview(imageView)
            
            
        }
        self.view.addSubview(scroll)
        
    }
    func tapped() {
        let  story = UIStoryboard(name: "Main", bundle: nil)
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = story.instantiateInitialViewController()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
   
   
}
