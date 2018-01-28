//
//  ViewController.m
//  OurBibleLiteMac
//
//  Created by 倪 李俊 on 2018/1/27.
//  Copyright © 2018年 com.sinri. All rights reserved.
//

#import "ViewController.h"

#import "AppDelegate.h"

@interface ViewController ()
@property (weak) AppDelegate*appDelagate;
@property CGFloat titleBarHeight;
@property BOOL isFullWindow;

//@property NSScrollView * container;

@end

@implementation ViewController

-(void)loadView{
    NSView * view=[[NSView alloc]initWithFrame:(NSMakeRect(0, 0, 800, 600))];
    [view setWantsLayer:YES];
    //[[view layer]setBorderColor:[[NSColor redColor]CGColor]];
    //[[view layer]setBorderWidth:2];
    self.view=view;
    
    _appDelagate=[[NSApplication sharedApplication]delegate];
    _titleBarHeight=_appDelagate.window.frame.size.height-view.frame.size.height;
    //NSLog(@"the window height = %f",_appDelagate.window.frame.size.height);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    _webView=[[WKWebView alloc]initWithFrame:(NSMakeRect(0, 0, self.view.frame.size.width, self.view.frame.size.height))];
    [_webView setUIDelegate:self];
    [_webView setNavigationDelegate:self];
    
    [self.view addSubview:_webView];    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowDidResize:) name:NSWindowDidResizeNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fullWindowOn) name:NSWindowDidEnterFullScreenNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fullWindowOff) name:NSWindowDidExitFullScreenNotification object:nil];
}

-(void)viewDidAppear{
    NSURLRequest *request=[ [NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://ourbible.everstray.com/frontend/reader.html"]];
    WKNavigation*navigation=[_webView loadRequest:request];
    NSLog(@"%s %s %i - %@",__FUNCTION__,__FILE__,__LINE__,navigation);
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)windowDidResize:(NSNotification *)aNotification
{
    // 调整NSWindow上NSView的frame
    CGFloat width=[_appDelagate window].frame.size.width;
    CGFloat height=[_appDelagate window].frame.size.height;
    
    NSLog(@"%s %s %i - Window Resize to (%f,%f)",__FUNCTION__,__FILE__,__LINE__,width,height);
    
    if(width<700)width=700;
    if(height<400)height=400;
    
    CGRect frame=self.view.frame;
    frame.size.width=width;
    frame.size.height=height-_titleBarHeight*(_isFullWindow?0:1);
    
    [self.view setFrame:frame];
    
    [self handleNotificationOfResize];
}


-(void)handleNotificationOfResize{
    //NSLog(@"%s %s %i - (%f,%f)",__FUNCTION__,__FILE__,__LINE__,self.view.frame.size.width,self.view.frame.size.height);
    NSRect rect=_webView.frame;
    rect.size=self.view.frame.size;
    [_webView setFrame:rect];
}

-(void)fullWindowOn{
    NSLog(@"%s %s %i - Full Window On",__FUNCTION__,__FILE__,__LINE__);
    _isFullWindow=YES;
    [self windowDidResize:nil];
}
-(void)fullWindowOff{
    NSLog(@"%s %s %i - Full Window Off",__FUNCTION__,__FILE__,__LINE__);
    _isFullWindow=NO;
    [self windowDidResize:nil];
}

#pragma -
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"%s %s %i - %@",__FUNCTION__,__FILE__,__LINE__,navigation);
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    //marquee
    NSLog(@"%s %s %i - %@",__FUNCTION__,__FILE__,__LINE__,navigation);
    
    NSString * hide_script=
    //@"document.getElementById('brand_div').style.display='none';";
    @"document.getElementsByTagName('marquee')[0].style.display='none';document.getElementById('brand_div_right').style.minWidth='300px';document.getElementById('brand_div_right').innerHTML='Copyright 2018 Sinri Edogawa';";
    
    [webView evaluateJavaScript:hide_script completionHandler:^(id _Nullable x, NSError * _Nullable error) {
        NSLog(@"hide marquee: %@,%@",x,error);
        //[[NSAlert alertWithError:error]runModal];
    }];
    
    
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"%s %s %i - %@ - ERROR: %@",__FUNCTION__,__FILE__,__LINE__,navigation,error.description);
    [[NSAlert alertWithError:error]runModal];
}


@end
