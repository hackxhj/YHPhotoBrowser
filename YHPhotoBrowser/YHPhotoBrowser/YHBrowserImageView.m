//
//  YHBrowserImageView.m
//  YHPhotoBrowser
//
//  Created by cardlan_yuhuajun on 2017/10/13.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "YHBrowserImageView.h"
//#import "UIImageView+WebCache.h"
@interface YHBrowserImageView()<UIScrollViewDelegate>
@property (nonatomic ,assign)BOOL doubleClick;
@end

@implementation YHBrowserImageView

 -(id)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame]){
        _doubleClick=YES;
        [self configSubView];
    }
    return self;
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    
    _mainUrl=url;
    [self resetImgView];
    [self.showImg yy_setImageWithURL:url placeholder:placeholder options:YYWebImageOptionIgnoreFailedURL completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        if (error) {
            UILabel *label = [[UILabel alloc] init];
            label.bounds = CGRectMake(0, 0, 160, 30);
            label.center = CGPointMake(self.showImg.bounds.size.width * 0.5, self.showImg.bounds.size.height * 0.5);
            label.text = @"图片加载失败";
            label.font = [UIFont systemFontOfSize:16];
            label.textColor = [UIColor whiteColor];
            label.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
            label.layer.cornerRadius = 5;
            label.clipsToBounds = YES;
            label.textAlignment = NSTextAlignmentCenter;
            [self.showImg addSubview:label];
        } else {
            self.showImg.image = image;
            [self setNeedsLayout];
        }
    }];
 
    
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGSize imageSize = self.showImg.image.size;
    
    // 填满图片
    if (self.bounds.size.width * (imageSize.height / imageSize.width) > self.bounds.size.height) {
      CGFloat imageViewH = self.bounds.size.width * (imageSize.height / imageSize.width);
      self.showImg.bounds = CGRectMake(0, 0, _imageScrollView.frame.size.width, imageViewH);
      self.showImg.center = CGPointMake(_imageScrollView.frame.size.width * 0.5,  self.showImg.frame.size.height * 0.5);
      _imageScrollView.contentSize = CGSizeMake(0, _showImg.bounds.size.height);
     }

}

-(void)resetImgView{
    _doubleClick=YES;
    self.showImg.bounds = CGRectMake(0, 0, _imageScrollView.frame.size.width, _imageScrollView.frame.size.height);
    self.showImg.center = CGPointMake(_imageScrollView.frame.size.width*0.5, _imageScrollView.frame.size.height*0.5);
    _imageScrollView.contentSize = CGSizeMake(0, 0);
}

-(void)configSubView{
    [self addSubview:self.imageScrollView];
    [self.imageScrollView addSubview:self.showImg];
    

}


-(UIScrollView *)imageScrollView
{
    if(!_imageScrollView){
        _imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _imageScrollView.backgroundColor = [UIColor blackColor];
        _imageScrollView.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        _imageScrollView.delegate = self;
        _imageScrollView.maximumZoomScale = 4;
        _imageScrollView.minimumZoomScale = 1;
        _imageScrollView.showsHorizontalScrollIndicator=NO;
        _imageScrollView.showsVerticalScrollIndicator=NO;
    }
    return _imageScrollView;
}

-(YYAnimatedImageView*)showImg
{
    if(!_showImg){
        _showImg=[[YYAnimatedImageView alloc]initWithFrame:self.bounds];
        _showImg.contentMode = UIViewContentModeScaleAspectFit;

    }
    return _showImg;
}

-(void)doubleZoomRect:(CGPoint)point
{
    CGFloat newscale = 2.0;
    CGRect zoomRect = [self zoomRectForScale:newscale withCenter:point andScrollView:self.imageScrollView];
    if (_doubleClick == YES)  {
        [self.imageScrollView zoomToRect:zoomRect animated:YES];
        
    }else {
       [self.imageScrollView zoomToRect:self.imageScrollView.frame animated:YES];
    }
    _doubleClick = !_doubleClick;

}
- (CGRect)zoomRectForScale:(CGFloat)newscale withCenter:(CGPoint)center andScrollView:(UIScrollView *)scrollV{
    
    CGRect zoomRect = CGRectZero;
     zoomRect.size.height = scrollV.frame.size.height / newscale;
    zoomRect.size.width = scrollV.frame.size.width  / newscale;
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    return zoomRect;
    
}


#pragma mark - ScorllViewDelegate

//告诉scrollview要缩放的是哪个子控件
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.showImg;
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
 
}
@end
