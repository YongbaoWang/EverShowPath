//
//  UIControl+EverPath.m
//  EverShowPath
//
//  Created by Ever on 17/1/2.
//  Copyright © 2017年 Beijing Byecity International Travel CO., Ltd. All rights reserved.
//  欢迎关注微信公众号：iOS狗
//

#import "UIControl+EverPath.h"
#import <objc/runtime.h>
#import "EverPathMacro.h"

@implementation UIControl (EverPath)

+(void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [self class];
        Method m1 = class_getInstanceMethod(cls, @selector(sendAction:to:forEvent:));
        Method m2 = class_getInstanceMethod(cls, @selector(sendAction_EverPath:to:forEvent:));
        method_exchangeImplementations(m1, m2);
    });
#endif
#endif
}

- (void)sendAction_EverPath:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [self sendAction_EverPath:action to:target forEvent:event];
    NSLog(@"Ever_UIControl_Path : %@,Action : %@",NSStringFromClass([target class]),NSStringFromSelector(action));
}

@end
