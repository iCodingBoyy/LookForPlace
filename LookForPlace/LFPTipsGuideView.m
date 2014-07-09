//
//  LFPTipsGuideView.m
//  LookForPlace
//
//  Created by 马远征 on 14-7-9.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "LFPTipsGuideView.h"
#import "AppDelegate.h"

static NSString *const KTipsGuideKey = @"tipsGuide.tip";

@implementation LFPTipsGuideView

+ (void)showTipsView
{
    if ( ! [[self class] isShowTips] )
    {
        return;
    }
    
    [[self class]saveTipsShowRecord];
    
    AppDelegate *delegate = (AppDelegate*)([UIApplication sharedApplication].delegate);
    LFPTipsGuideView *tipGuideView = [[[self class] alloc]initWithFrame:delegate.window.bounds];
    [delegate.window  addSubview:tipGuideView];
    tipGuideView = nil;
}

+(void)showTipsInView:(UIView*)view
{
    if ( ! [[self class] isShowTips] || view == nil)
    {
        return;
    }
    
    [[self class]saveTipsShowRecord];
    
    LFPTipsGuideView *tipGuideView = [[[self class] alloc]initWithFrame:view.bounds];
    [view addSubview:tipGuideView];
    tipGuideView = nil;
}


+ (BOOL)isShowTips
{
    NSUserDefaults *standDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *number = [standDefaults objectForKey:KTipsGuideKey];
    if ([number boolValue])
    {
        return NO;
    }
    return YES;
}

+ (void)saveTipsShowRecord
{
    NSUserDefaults *standDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *number = [NSNumber numberWithBool:YES];
    [standDefaults setObject:number forKey:KTipsGuideKey];
    [standDefaults synchronize];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor blackColor];
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setContentSize:CGSizeMake(KScreenWidth*5, self.bounds.size.height)];
    [scrollView setPagingEnabled:YES];
    [self addSubview:scrollView];
    
    NSArray *imageArray = @[@"tips1.jpg",@"tips2.jpg",@"tips3.jpg",@"tips4.jpg",@"tips5.jpg"];
    for (int i = 0 ; i < imageArray.count ; i++)
    {
        CGRect imageframe = CGRectMake(KScreenWidth*i, 0, KScreenWidth, self.bounds.size.height);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:imageframe];
        [imageView setImage:[UIImage imageNamed:imageArray[i]]];
        [scrollView addSubview:imageView];
    }
    
    CGFloat diffValue = IS_IPHONE_5 ? 5:20;
    UIButton *leaveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leaveBtn setFrame:CGRectMake(KScreenWidth*4+60, self.bounds.size.height - 140+diffValue, 200, 80)];
    [leaveBtn addTarget:self action:@selector(clickToleave) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:leaveBtn];
    
}

- (void)clickToleave
{
    WEAKSELF;
    [UIView animateWithDuration:0.35 animations:^{
        STRONGSELF;
        strongSelf.alpha = 0;
    } completion:^(BOOL finished) {
        
        [weakSelf removeFromSuperview];
    }];
}

@end
