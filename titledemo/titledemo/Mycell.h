//
//  mycell.h
//  titledemo
//
//  Created by yan feng on 2018/4/19.
//  Copyright © 2018年 Yan feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mycell : UIView
 
-(void)setValue:(NSString *)labeltext;
+(void)setHidden:(Mycell *)oldcell withShow:(Mycell *)newcell withnum:(NSInteger)num;
@end
