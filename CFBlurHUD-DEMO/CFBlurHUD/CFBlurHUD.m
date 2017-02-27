//
//  CFBlurHUD.m
//  CFBlurHUD
//
//  Created by 周凌宇 on 15/11/6.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import "CFBlurHUD.h"
#import "UIView+Extension.h"
#import "NSString+CFNSStringExt.h"

#define CFBlurHUDWidth 150
#define CFBlurHUDMargin 12
#define CFBlurHUDMessageHeight 50
#define CFBlurHUDMessageFont [UIFont boldSystemFontOfSize:14]

@interface CFBlurHUD ()

@property (nonatomic, weak) UIActivityIndicatorView *aivLoading;
@property (nonatomic, weak) UILabel *lblMessage;
@property (nonatomic, weak) UIImageView *imgSuccess;
@property (nonatomic, weak) UIImageView *imgFaild;
@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *messageColor;
@property (nonatomic, strong) UIColor *activityIndicatorColor;


@end

@implementation CFBlurHUD

+ (CFBlurHUD *)hud {
    __strong static CFBlurHUD *sharedManager;
        static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[CFBlurHUD alloc] init];
        sharedManager.borderColor = [UIColor colorWithRed:98/255.0 green:98/255.0 blue:98/255.0 alpha:0.5];
        sharedManager.messageColor = [UIColor colorWithRed:110/255.0 green:110/255.0 blue:110/255.0 alpha:1];
        sharedManager.activityIndicatorColor = [UIColor colorWithRed:142/255.0 green:155/255.0 blue:236/255.0 alpha:1];
    });
    
    return sharedManager;
}

#pragma mark - =======================Public=======================

+ (void)configBorderColor:(UIColor *)color {
    [self hud].borderColor = color;
}

+ (void)configMessageColor:(UIColor *)color {
    [self hud].messageColor = color;
}

+ (void)show:(NSString *)message {

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CFBlurHUD *hud = [self hud];
    [window addSubview:hud];
    
    hud.lblMessage.text = message;
    hud.message = message;
    
    hud.lblMessage.hidden = NO;
    hud.aivLoading.hidden = NO;
    hud.imgSuccess.hidden = YES;
    hud.imgFaild.hidden = YES;
    
    [hud layoutSubviews];

    hud.transform = CGAffineTransformScale(hud.transform, 0.1, 0.1);
    [UIView animateWithDuration:0.3 animations:^{
        hud.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
    
}


+ (void)showSuccess:(NSString *)message {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CFBlurHUD *hud = [self hud];
    [window addSubview:hud];
    
    hud.lblMessage.text = message;
    hud.message = message;
    
    hud.lblMessage.hidden = NO;
    hud.aivLoading.hidden = YES;
    hud.imgSuccess.hidden = NO;
    hud.imgFaild.hidden = YES;
    
    [hud layoutSubviews];
    
    hud.transform = CGAffineTransformScale(hud.transform, 0.1, 0.1);
    [UIView animateWithDuration:0.3 animations:^{
        hud.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
    
}

+ (void)showFaild:(NSString *)message {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CFBlurHUD *hud = [self hud];
    [window addSubview:hud];
    
    hud.lblMessage.text = message;
    hud.message = message;
    
    hud.lblMessage.hidden = NO;
    hud.aivLoading.hidden = YES;
    hud.imgSuccess.hidden = YES;
    hud.imgFaild.hidden = NO;
    
    [hud layoutSubviews];
    
    hud.transform = CGAffineTransformScale(hud.transform, 0.1, 0.1);
    [UIView animateWithDuration:0.3 animations:^{
        hud.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
}

+ (void)dismiss {
    CFBlurHUD *hud = [self hud];
    [UIView animateWithDuration:0.3 animations:^{
        hud.transform = CGAffineTransformScale(hud.transform, 0.1, 0.1);
    } completion:^(BOOL finished) {
        [hud removeFromSuperview];
    }];
}

#pragma mark - =======================Life Cycle=======================

- (instancetype)init {
    if (self = [super initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]]) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 20.0;

        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [_borderColor CGColor];
    }
    return self;
}

- (void)layoutSubviews {
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    CGFloat hudWH = CFBlurHUDWidth;
    CGFloat hudX = (screenW - hudWH) * 0.5;
    CGFloat hudY = (screenH - hudWH) * 0.5;
    self.frame = CGRectMake(hudX, hudY, hudWH, hudWH);
    
    CGFloat hudW = self.width;
    CGFloat hudH = self.height;
    
    CGFloat aivW = 37;
    CGFloat aivH = 37;
    CGFloat aivX = (hudW - aivW) * 0.5;
    CGFloat aivY = (hudH - aivH) * 0.5;
    self.aivLoading.frame = CGRectMake(aivX, aivY, aivW, aivH);
    self.imgSuccess.frame = CGRectMake(aivX, aivY, aivW, aivH);
    self.imgFaild.frame = CGRectMake(aivX, aivY, aivW, aivH);

    // 有文字消息
    if(![@"" isEqualToString:self.message]) {
        CGSize size = [self.message sizeOfTextWithMaxSize:CGSizeMake(CFBlurHUDWidth - CFBlurHUDMargin * 2, MAXFLOAT) font:CFBlurHUDMessageFont];
        
        // 略微调高aiv
        CGFloat aivY = (hudH - aivH) * 0.5 - 15;
        self.aivLoading.y = aivY;
        self.imgSuccess.y = aivY;
        self.imgFaild.y = aivY;

        CGFloat messageW = CFBlurHUDWidth - CFBlurHUDMargin * 2;
        CGFloat messageH = size.height;
        CGFloat messageX = (hudW - messageW) * 0.5;
        CGFloat messageY = CGRectGetMaxY(self.aivLoading.frame) + 20;
        self.lblMessage.frame = CGRectMake(messageX, messageY, messageW, messageH);
        
        // 高超过限定值，增加自身高度
        if (size.height > (CFBlurHUDMessageHeight)) {
            self.height = CGRectGetMaxY(self.lblMessage.frame) + CFBlurHUDMargin;
            self.x = (screenW - self.width) * 0.5;
        }
    }
}

#pragma mark - =======================Getter Setter=======================

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = [_borderColor CGColor];
}

- (void)setMessageColor:(UIColor *)messageColor {
    _messageColor = messageColor;
    self.lblMessage.textColor = self.messageColor;
}

- (UIActivityIndicatorView *)aivLoading {
    if (_aivLoading == nil) {
        UIActivityIndicatorView *aivLoading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [aivLoading startAnimating];
        aivLoading.color = self.activityIndicatorColor;
        [self addSubview:aivLoading];
        _aivLoading = aivLoading;
    }
    return _aivLoading;
}

- (UILabel *)lblMessage {
    if (_lblMessage == nil) {
        UILabel *lblMessage = [[UILabel alloc] init];
        lblMessage.font = CFBlurHUDMessageFont;
        lblMessage.numberOfLines = 0;
        lblMessage.textColor = self.messageColor;
        lblMessage.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lblMessage];
        _lblMessage = lblMessage;
    }
    return _lblMessage;
}

- (UIImageView *)imgSuccess {
    if (_imgSuccess == nil) {
        UIImageView *imgSuccess = [[UIImageView alloc] init];
        imgSuccess.image = [UIImage imageNamed:@"success"];
        [self addSubview:imgSuccess];
        _imgSuccess = imgSuccess;
    }
    return _imgSuccess;
}

- (UIImageView *)imgFaild {
    if (_imgFaild == nil) {
        UIImageView *imgFaild = [[UIImageView alloc] init];
        imgFaild.image = [UIImage imageNamed:@"faild"];
        [self addSubview:imgFaild];
        _imgFaild = imgFaild;
    }
    return _imgFaild;
}

@end
