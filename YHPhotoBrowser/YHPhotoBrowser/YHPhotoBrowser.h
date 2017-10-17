//
//  YHPhotoBrowser.h
//  YHPhotoBrowser
//
//  Created by cardlan_yuhuajun on 2017/10/13.
//  Copyright © 2017年 hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHPhotoBrowser : UIView
@property(nonatomic,assign)NSInteger indexTag;  //初始化显示的图片
@property(nonatomic,strong)NSArray<NSString*> *urlImgArr;//网络图片URL
@property(nonatomic,assign)CGRect sourceRect;  //点击的图片frame。->动画要用
-(void)show;
@end
