//
//  CFBlurHUD.h
//  CFBlurHUD
//
//  Created by 周凌宇 on 15/11/6.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFBlurHUD : UIVisualEffectView
/**
 *  显示指示器
 *  如果不希望有文字，message填入nil或者@""
 *
 *  @param message 信息文本
 */
+ (void)show:(NSString *)message;

/**
 *  显示成功指示器
 *  如果不希望有文字，message填入nil或者@""
 *
 *  @param message 信息文本
 */
+ (void)showSuccess:(NSString *)message;

/**
 *  显示错误指示器
 *  如果不希望有文字，message填入nil或者@""
 *
 *  @param message 信息文本
 */
+ (void)showFaild:(NSString *)message;

/**
 *  撤去指示器
 */
+ (void)dismiss;

+ (void)configBorderColor:(UIColor *)color;

+ (void)configMessageColor:(UIColor *)color;

@end
