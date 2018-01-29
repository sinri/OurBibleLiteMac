//
//  AboutViewController.m
//  OurBibleLiteMac
//
//  Created by 倪 李俊 on 2018/1/28.
//  Copyright © 2018年 com.sinri. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

-(void)loadView{
    NSView * view=[[NSView alloc]initWithFrame:(NSMakeRect(0, 0, 300, 200))];
    [view setWantsLayer:YES];
    [[view layer]setBorderColor:[[NSColor redColor]CGColor]];
    [[view layer]setBorderWidth:2];
    self.view=view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
