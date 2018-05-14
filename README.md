# YHPhotoBrowser 是优化性能的 SDPhotoBrowser

注意本开源修改于 
https://github.com/gsdios/SDPhotoBrowser 修改
而来 感谢作者的开源

```ruby
使用场景

UIWebView或者WKWebView或者图片布局自定义的视图

网络图片浏览器 支持gif 图片自适应 图片放大缩小 动画,下拽图片视图关闭手势,loading加载 保存本地等
```


#### 1:优化视图创建，原作者是对每张图片创建了视图 ，本开源使用三个视图实现图片浏览

#### 2:大量gif播放内存问题 之前使用sd 现在依赖yywebimage 内存飙升不存在的

#### 3:动画的判断 设置原始位置 适用于各种情况的图片浏览（修改也是给我一个新闻客户端 作图片浏览器）看效果图

#### 4:简化了接口 使用更简单



使用例子：
### 支持pod导入
```ruby
pod 'YHPhotoBrowser','~> 0.0.9'
```


###  头文件引入

```objc
#import "YHPhotoBrowser.h"
```

### 使用

```objc
    
 
    NSArray *srchightArray = @[@"http://ww2.sinaimg.cn/bmiddle/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                               @"http://ww2.sinaimg.cn/bmiddle/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                               @"http://ww2.sinaimg.cn/bmiddle/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                               @"http://ww2.sinaimg.cn/bmiddle/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                               @"http://ww2.sinaimg.cn/bmiddle/642beb18gw1ep3629gfm0g206o050b2a.gif",
                               @"http://ww1.sinaimg.cn/bmiddle/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg"
                                ];

    YHPhotoBrowser *photoView=[[YHPhotoBrowser alloc]init];
    photoView.sourceView=self.wkWebView;         // 图片所在的父容器
    photoView.urlImgArr=srchightArray;           //网络链接图片的数组
    photoView.sourceRect=self.imgView3.frame;   // 图片的frame
    photoView.indexTag=0;                      //初始化进去显示的图片下标
    [photoView show];
 
```

### 注意 
pod导入方式 依赖 'YYWebImage'
如果有冲突 请注释原pod的 YYWebImage 或者手动导入本库 YHPhotoBrowser文件夹、

#  看效果图  demo 详细使用

 <img src="https://raw.githubusercontent.com/hackxhj/YHPhotoBrowser/master/png/yh.gif" alt="show" title="show">

 <img src="https://raw.githubusercontent.com/hackxhj/YHPhotoBrowser/master/png/mem.png" alt="show" title="show">
 
 <img src="https://raw.githubusercontent.com/hackxhj/YHPhotoBrowser/master/png/ok.gif" alt="show" title="show">


