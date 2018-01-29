//
//  MainMenu.m
//  OurBibleLiteMac
//
//  Created by 倪 李俊 on 2018/1/28.
//  Copyright © 2018年 com.sinri. All rights reserved.
//

#import "MainMenu.h"

@implementation MainMenu

-(instancetype)init{
    self=[super initWithTitle:@"Main Menu"];// this title will be ignored
    if(self){
        //this title will be ignored
        NSMenuItem * appItem = [[NSMenuItem alloc] initWithTitle:@"App Item" action:Nil keyEquivalent:@""];
        [self addItem:appItem];
        
        // this title will be ignore too
        NSMenu *appMenu = [[NSMenu alloc] initWithTitle:@"application"];
        self.aboutItem  = [[NSMenuItem alloc] initWithTitle:@"About" action:Nil keyEquivalent:@""];
        [appMenu addItem:self.aboutItem];
        [appMenu addItem:[NSMenuItem separatorItem]];
        self.quitItem = [[NSMenuItem alloc] initWithTitle:@"Quit" action:Nil keyEquivalent:@"q"];
        self.quitItem.keyEquivalentModifierMask=NSEventModifierFlagCommand;
        [appMenu addItem:self.quitItem];
        [self setSubmenu:appMenu forItem:appItem];

    }
    return self;
}

@end
