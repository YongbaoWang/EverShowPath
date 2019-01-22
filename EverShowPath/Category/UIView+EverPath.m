//
//  UIView+EverPath.m
//  SPTAPLive
//
//  Created by Ever on 2019/1/22.
//  欢迎关注微信公众号：iOS狗
//

#import "UIView+EverPath.h"
#import <objc/runtime.h>
#import "EverPathMacro.h"

@implementation UIView (EverPath)

+ (void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [self class];
        Method m1 = class_getInstanceMethod(cls, @selector(hitTest:withEvent:));
        Method m2 = class_getInstanceMethod(cls, @selector(hitTest:withEvent_EverPath:));
        method_exchangeImplementations(m1, m2);
    });
#endif
#endif
}

- (UIView *)hitTest:(CGPoint)point withEvent_EverPath:(UIEvent *)event {
    printf("Ever_HitTest_Path:%s\n",self.description.UTF8String);
    return [self hitTest:point withEvent_EverPath:event];
}

@end
