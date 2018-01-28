//
//  AppDelegate.h
//  OurBibleLiteMac
//
//  Created by 倪 李俊 on 2018/1/27.
//  Copyright © 2018年 com.sinri. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TheWindow.h"
#import "ViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic,strong) TheWindow *window;

@property (nonatomic,strong) ViewController *masterViewController;

@end

