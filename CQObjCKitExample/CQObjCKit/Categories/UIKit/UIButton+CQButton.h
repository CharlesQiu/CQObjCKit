//
//  UIButton+CQButton.h
//  CQObjCKit
//
//  Created by Alice on 2018/10/27.
//  Copyright © 2018 Charles.Qiu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (CQButton)

/**
 *  @brief  设置按钮额外热区
 */
@property (nonatomic, assign) UIEdgeInsets cq_touchAreaInsets;

@end

NS_ASSUME_NONNULL_END
