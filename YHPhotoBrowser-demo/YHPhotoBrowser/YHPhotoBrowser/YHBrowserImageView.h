//
//  YHBrowserImageView.h
//  YHPhotoBrowser
//
//  Created by cardlan_yuhuajun on 2017/10/13.
//  Copyright © 2017年 hua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYWebImage/YYWebImage.h>



@interface YHBrowserImageView : UIView
@property(nonatomic,strong) UIScrollView *imageScrollView;
@property(nonatomic,strong) YYAnimatedImageView  *showImg;

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
-(void)doubleZoomRect:(CGPoint)point;
@property(nonatomic,strong)NSURL* mainUrl;
@property(nonatomic,assign)NSInteger utag;
@end
