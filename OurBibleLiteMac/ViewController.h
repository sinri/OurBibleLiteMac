//
//  ViewController.h
//  OurBibleLiteMac
//
//  Created by 倪 李俊 on 2018/1/27.
//  Copyright © 2018年 com.sinri. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface ViewController : NSViewController
<WKUIDelegate,WKNavigationDelegate>

@property WKWebView *webView;

@end

