//
//  UIButton+CQButton.m
//  CQObjCKit
//
//  Created by Alice on 2018/10/27.
//  Copyright © 2018 Charles.Qiu. All rights reserved.
//

#import <objc/runtime.h>
#import "UIButton+CQButton.h"

@implementation UIButton (CQButton)

- (UIEdgeInsets)jk_touchAreaInsets {
    return [objc_getAssociatedObject(self, @selector(cq_touchAreaInsets)) UIEdgeInsetsValue];
}
/**
 *  @brief  设置按钮额外热区
 */
- (void)setCq_touchAreaInsets:(UIEdgeInsets)touchAreaInsets {
    NSValue *value = [NSValue valueWithUIEdgeInsets:touchAreaInsets];
    objc_setAssociatedObject(self, @selector(cq_touchAreaInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    UIEdgeInsets touchAreaInsets = self.cq_touchAreaInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left,
                        bounds.origin.y - touchAreaInsets.top,
                        bounds.size.width + touchAreaInsets.left + touchAreaInsets.right,
                        bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
    return CGRectContainsPoint(bounds, point);
}

@end
