//
//  UITableView+EverPath.m
//  longzhu
//
//  Created by Ever on 2017/8/11.
//  Copyright © 2017年 developer. All rights reserved.
//
//  欢迎关注微信公众号：iOS狗

#import "UITableView+EverPath.h"
#import <objc/runtime.h>
#import "EverPathMacro.h"

@implementation UITableView (EverPath)

+ (void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [self class];
        //Note:it's a private class action! Don't submit to the App Store!
        Method m1 = class_getInstanceMethod(cls, NSSelectorFromString(@"_selectRowAtIndexPath:animated:scrollPosition:notifyDelegate:"));
        Method m2 = class_getInstanceMethod(cls, NSSelectorFromString(@"selectRowAtIndexPath:animated:scrollPosition:notifyDelegate_EverPath:"));
        method_exchangeImplementations(m1, m2);
        
    });
#endif
#endif
}

- (void)selectRowAtIndexPath:(id)arg1 animated:(BOOL)arg2 scrollPosition:(int)arg3 notifyDelegate_EverPath:(BOOL)arg4
{
    [self selectRowAtIndexPath:arg1 animated:arg2 scrollPosition:arg3 notifyDelegate_EverPath:arg4];
    printf("Ever_UITableView_Delegate_Path:%s\n",NSStringFromClass([self.delegate class]).UTF8String);
}

@end
