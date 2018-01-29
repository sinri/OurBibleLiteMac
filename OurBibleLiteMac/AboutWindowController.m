//
//  AboutWindowController.m
//  OurBibleLiteMac
//
//  Created by 倪 李俊 on 2018/1/29.
//  Copyright © 2018年 com.sinri. All rights reserved.
//

#import "AboutWindowController.h"

@interface AboutWindowController ()

@end

@implementation AboutWindowController

-(instancetype)init{
    self=[super initWithWindowNibName:@"AboutWindowController"];
    if(self){
        
    }
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    self.window.title=@"About";
}


@end
