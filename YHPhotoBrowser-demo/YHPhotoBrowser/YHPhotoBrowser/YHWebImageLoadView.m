//
//  YHVideoLoadView.m
//  GameTodayNews
//
//  Created by cardlan_yuhuajun on 2017/11/6.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "YHWebImageLoadView.h"

@interface YHWebImageLoadView()
@property (nonatomic, strong) UIImageView *loadingImageView;

@end

@implementation YHWebImageLoadView

-(id)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        [self initSubView];
    }
    return self;
}
-(id)init{
    if(self=[super init])
    {
        [self initSubView];
    }
    return self;
}
-(void)initSubView{
    self.userInteractionEnabled=NO;
    [self addSubview:self.loadingImageView];
 
    self.loadingImageView.frame=CGRectMake(0, 0, 50, 50);

    
}
- (void)loading {
    
    self.loadingImageView.hidden=NO;
 
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.byValue = @(2 * M_PI);
    animation.duration = 1;
    animation.repeatCount = HUGE_VALF;
    [self.loadingImageView.layer addAnimation:animation forKey:@"video_fullLoading"];
}

- (void)stop {
    self.loadingImageView.hidden=YES;
    [self.loadingImageView.layer removeAllAnimations];
}
- (UIImageView *)loadingImageView {
    if (!_loadingImageView) {
         _loadingImageView.hidden=YES;
         _loadingImageView = [UIImageView  new];
         _loadingImageView.image = [UIImage imageNamed:@"video_fullLoading"];
    }
    return _loadingImageView;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
