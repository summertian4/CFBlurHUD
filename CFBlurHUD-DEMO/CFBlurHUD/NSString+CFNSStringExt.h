//
//  NSString+CFNSStringExt.h
//  day32_010_QQ
//
//  Created by 周凌宇 on 15/9/1.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CFNSStringExt)

- (CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font;
- (CGSize)sizeOfTextWithfont:(UIFont *)font;
+ (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font;

@end
