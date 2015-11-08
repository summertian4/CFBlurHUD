//
//  NSString+CFNSStringExt.m
//  day32_010_QQ
//
//  Created by 周凌宇 on 15/9/1.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "NSString+CFNSStringExt.h"

@implementation NSString (CFNSStringExt)

- (CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeOfTextWithfont:(UIFont *)font {
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [self sizeWithAttributes:attr];
}

+ (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font {
    return [text sizeOfTextWithMaxSize:maxSize font:font];
}

@end
