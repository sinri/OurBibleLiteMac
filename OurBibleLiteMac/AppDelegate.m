//
//  AppDelegate.m
//  OurBibleLiteMac
//
//  Created by 倪 李俊 on 2018/1/27.
//  Copyright © 2018年 com.sinri. All rights reserved.
//

#import "AppDelegate.h"

#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>


@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [Fabric with:@[[Crashlytics class]]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{ @"NSApplicationCrashOnExceptions": @YES }];

    
    // 1. Create the master View Controller
    self.masterViewController = [[ViewController alloc] init];
    
    // 2. Add the view controller to the Window's content view
    self.window=[[TheWindow alloc]initWithContentRect:(NSMakeRect(0,0,800,600))
                                            styleMask:(NSWindowStyleMaskResizable|NSWindowStyleMaskTitled|NSWindowStyleMaskClosable|NSWindowStyleMaskMiniaturizable)
                                              backing:(NSBackingStoreBuffered)
                                                defer:NO
                 ];
    //self.window=[TheWindow windowWithContentViewController:self.masterViewController];
    [self.window.contentView addSubview:self.masterViewController.view];
    self.masterViewController.view.frame = ((NSView*)self.window.contentView).bounds;
    
    [self.window setTitle:@"OurBible Mac Lite (Version 1.0)"];
    
    [self.window makeKeyAndOrderFront:nil];
    
    
}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender{
    return YES;
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
