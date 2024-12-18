//
//  UIColor+Hex.m
//  TOCropViewControllerExample
//
//  Created by Мария Анисович on 13.12.2024.
//  Copyright © 2024 Tim Oliver. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHex:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if ([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)], [cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)], [cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)], [cleanString substringWithRange:NSMakeRange(2, 1)]];
    }

    if ([cleanString length] == 6) {
        unsigned int r, g, b;
        NSScanner *scanner = [NSScanner scannerWithString:[cleanString substringWithRange:NSMakeRange(0, 2)]];
        [scanner scanHexInt:&r];
        scanner = [NSScanner scannerWithString:[cleanString substringWithRange:NSMakeRange(2, 2)]];
        [scanner scanHexInt:&g];
        scanner = [NSScanner scannerWithString:[cleanString substringWithRange:NSMakeRange(4, 2)]];
        [scanner scanHexInt:&b];
        
        return [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:1.0];
    }
    
    return [UIColor blackColor];
}

@end
