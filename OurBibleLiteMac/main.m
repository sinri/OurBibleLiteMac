//
//  main.m
//  OurBibleLiteMac
//
//  Created by 倪 李俊 on 2018/1/27.
//  Copyright © 2018年 com.sinri. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    AppDelegate * delegate=[[AppDelegate alloc]init];
    [[NSApplication sharedApplication]setDelegate:delegate];
    
    return NSApplicationMain(argc, argv);
}
