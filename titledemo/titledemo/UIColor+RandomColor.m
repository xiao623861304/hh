//
//  UIColor+RandomColor.m
//  titledemo
//
//  Created by yan feng on 2018/4/20.
//  Copyright © 2018年 Yan feng. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)
+ (UIColor *)randomColor {

    CGFloat hue = arc4random() % 100 / 100.0;
    CGFloat saturation = (arc4random() % 50 / 100) + 0.5;
    CGFloat brightness = (arc4random() % 50 / 100) + 0.5;
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
