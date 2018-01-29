//
//  AppDelegate.m
//  OurBibleLiteMac
//
//  Created by 倪 李俊 on 2018/1/27.
//  Copyright © 2018年 com.sinri. All rights reserved.
//

#import "AppDelegate.h"
#import "MainMenu.h"
#import "AboutViewController.h"
#import "AboutWindowController.h"

#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>


@interface AppDelegate ()
@property AboutWindowController *aboutWindowController;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [Fabric with:@[[Crashlytics class]]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{ @"NSApplicationCrashOnExceptions": @YES }];

    
    // 1. Create the master View Controller
    self.masterViewController = [[ViewController alloc] init];
    
    // 2. Add the view controller to the Window's content view
    self.window=[[TheWindow alloc]initWithContentRect:(NSMakeRect(100,100,800,600))
                                            styleMask:(NSWindowStyleMaskResizable|NSWindowStyleMaskTitled|NSWindowStyleMaskClosable|NSWindowStyleMaskMiniaturizable)
                                              backing:(NSBackingStoreBuffered)
                                                defer:NO
                 ];
    //self.window=[TheWindow windowWithContentViewController:self.masterViewController];
    [self.window.contentView addSubview:self.masterViewController.view];
    self.masterViewController.view.frame = ((NSView*)self.window.contentView).bounds;
    
    [self.window setTitle:@"OurBible Lite (Version 1.0)"];
    
    [self.window makeKeyAndOrderFront:nil];
    
    // menu
    
    NSApplication *app = [NSApplication sharedApplication];
    MainMenu *mainMenu = [[MainMenu alloc] init];
    
    mainMenu.quitItem.target = self;
    mainMenu.quitItem.action = @selector(quit:);
    
    mainMenu.aboutItem.target=self;
    mainMenu.aboutItem.action=@selector(about:);
    
    app.mainMenu = mainMenu;
    
}

-(void) quit:(id)sender {
    [NSApp terminate:self];
}

-(void)about:(id)sender{
    /*
    AboutViewController*vc=[[AboutViewController alloc]init];
    NSWindow * aboutWindow=[[NSWindow alloc]initWithContentRect:(NSMakeRect(300,300,300,200))
                                                       styleMask:(NSWindowStyleMaskResizable|NSWindowStyleMaskTitled|NSWindowStyleMaskClosable|NSWindowStyleMaskDocModalWindow)
                                                         backing:(NSBackingStoreBuffered)
                                                           defer:NO
                            ];
    [aboutWindow.contentView addSubview:vc.view];
    vc.view.frame = ((NSView*)aboutWindow.contentView).bounds;
    [vc setTitle:@"About"];
    [aboutWindow makeKeyAndOrderFront:nil];
     */
    _aboutWindowController = [[AboutWindowController alloc] init];
    [_aboutWindowController showWindow:self];
}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender{
    return YES;
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
