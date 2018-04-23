//
//  mycell.m
//  titledemo
//
//  Created by yan feng on 2018/4/19.
//  Copyright © 2018年 Yan feng. All rights reserved.
//

#import "Mycell.h"

@interface Mycell()
@property(strong , nonatomic)UIView * line;
@property(strong , nonatomic)UILabel * label ;
@end

@implementation Mycell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor whiteColor];
        [self setupview];
        [self addSubview:self.label];
    
    }
    return self;
}
-(void)setupview{
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, self.frame.size.width-10, 59)];
    self.label.textAlignment = NSTextAlignmentCenter ;
    self.label.textColor = [UIColor redColor];
    self.label.font =[UIFont systemFontOfSize:16];

}
-(void)setValue:(NSString *)labeltext{
    self.label.text = labeltext;

}
+(void)setHidden:(Mycell *)oldcell withShow:(Mycell *)newcell withnum:(NSInteger)num{
    oldcell.label.font = [UIFont systemFontOfSize:16];
    newcell.label.font = [UIFont boldSystemFontOfSize:30];
 
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
