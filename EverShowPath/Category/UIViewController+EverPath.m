//
//  UIViewController+EverPath.m
//  EverShowPath
//
//  Created by Ever on 17/1/2.
//  Copyright © 2017年 Beijing Byecity International Travel CO., Ltd. All rights reserved.
//  欢迎关注微信公众号：iOS狗
//

#import "UIViewController+EverPath.h"
#import <objc/runtime.h>
#import "EverPathMacro.h"

@implementation UIViewController (EverPath)

+ (void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [UIViewController class];
        Method m1 = class_getInstanceMethod(cls, @selector(viewDidLoad));
        Method m2 = class_getInstanceMethod(cls, @selector(ViewDidLoad_EverPath));
        method_exchangeImplementations(m1, m2);
    });
#endif
#endif
}

- (void)ViewDidLoad_EverPath
{
    [self ViewDidLoad_EverPath];
    printf("Ever_VC_Path:%s\n",NSStringFromClass(self.class).UTF8String);
}

@end
