//
//  ViewController.m
//  YHPhotoBrowser
//
//  Created by cardlan_yuhuajun on 2017/10/13.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "ViewController.h"
#import "YHPhotoBrowser.h"
#import  "YYWebImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    [self.imgView3 yy_setImageWithURL:[NSURL URLWithString:@"http://ww2.sinaimg.cn/bmiddle/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg"] placeholder:nil];
    self.imgView3.contentMode = UIViewContentModeScaleAspectFit;

   

}

- (IBAction)show:(id)sender {
    
    NSArray *srcStringArray = @[@"http://ww2.sinaimg.cn/thumbnail/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                                @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                                @"http://ww2.sinaimg.cn/thumbnail/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                                @"http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                                @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                                @"http://ww1.sinaimg.cn/thumbnail/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg"
                                ];
    
    NSArray *srchightArray = @[@"http://ww2.sinaimg.cn/bmiddle/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",

                    
                                ];
    /*
     @"http://ww2.sinaimg.cn/bmiddle/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
     @"http://ww2.sinaimg.cn/bmiddle/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg"
     @"http://ww2.sinaimg.cn/bmiddle/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
     @"http://ww2.sinaimg.cn/bmiddle/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
     @"http://ww2.sinaimg.cn/bmiddle/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
     @"http://ww2.sinaimg.cn/bmiddle/642beb18gw1ep3629gfm0g206o050b2a.gif",
     @"http://ww1.sinaimg.cn/bmiddle/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg"
     @"http://ww2.sinaimg.cn/bmiddle/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
     @"http://ww2.sinaimg.cn/bmiddle/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
     
     @"http://ww2.sinaimg.cn/bmiddle/642beb18gw1ep3629gfm0g206o050b2a.gif",
     @"http://ww1.sinaimg.cn/bmiddle/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg"
     */
    
    YHPhotoBrowser *photoView=[[YHPhotoBrowser alloc]init];
    photoView.urlImgArr=srchightArray;
    photoView.sourceRect=self.imgView3.frame;
    photoView.indexTag=0;
    [photoView show];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
