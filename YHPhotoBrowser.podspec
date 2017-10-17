Pod::Spec.new do |s|
  s.name         = "YHPhotoBrowser"
  s.version      = "0.0.1"
  s.summary      = "photo browser for ios"
  s.homepage     = "https://github.com/hackxhj/YHPhotoBrowser.git"
  s.license      = "MIT"
  s.author             = { "hackxhj" => "643087041@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/hackxhj/YHPhotoBrowser.git", :tag => "0.0.1" }
  s.source_files  = "HUPhotoBrowser", "HUPhotoBrowser/**/*.{h,m}"
   s.framework  = "UIKit"