//
//  ViewController.m
//  titledemo
//
//  Created by yan feng on 2018/4/19.
//  Copyright © 2018年 Yan feng. All rights reserved.
//

#import "ViewController.h"
#import "Mycell.h"
#import "UIColor+RandomColor.h"
#define MODEL_NUMBER 5

@interface ViewController ()<UIScrollViewDelegate>
{
    NSInteger oldtag;
}
@property(strong , nonatomic)UIScrollView *myscroll;
@property(assign , nonatomic)NSInteger cellWidth;
@property(strong , nonatomic)Mycell * mycell;
@property(strong , nonatomic)NSMutableArray * mycellarray;
@property(strong , nonatomic)UIView * line;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray * array = [NSMutableArray array];
    for (int  i=0 ; i<9; i++) {
        [array addObject:[NSString stringWithFormat:@"%d",i]];
    }
    oldtag = 0;
    self.mycellarray  = [NSMutableArray array];
    self.cellWidth = self.view.frame.size.width/MODEL_NUMBER;
    self.view.backgroundColor = [UIColor whiteColor];
    self.myscroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 60)];
    self.myscroll.contentSize = CGSizeMake(self.cellWidth*array.count, 60);
    self.myscroll.delegate = self;
    self.myscroll.showsHorizontalScrollIndicator = NO;
    self.myscroll.showsVerticalScrollIndicator = YES;
    [self.view addSubview:self.myscroll];

    for (int i=0; i<array.count; i++) {
        self.mycell = [[Mycell alloc]initWithFrame:CGRectMake(i*self.cellWidth, 0, self.cellWidth, 60)];
        [self.mycell setValue:array[i]];
        self.mycell.tag = 1000+i;
        [self.myscroll addSubview:self.mycell];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(totap:)];
        [self.mycell addGestureRecognizer:tap];
        [self.mycellarray addObject:self.mycell];
    }
    self.line = [[UIView alloc]init];
    self.line.frame = CGRectMake(0, 55, self.cellWidth, 1.5);
    self.line.backgroundColor = [UIColor orangeColor];
    [self.myscroll addSubview:self.line];
}
-(void)totap:(UITapGestureRecognizer *)tap{
    
    Mycell *newcell = self.mycellarray[tap.view.tag-1000];
    Mycell *oldcell = self.mycellarray[oldtag];
    [Mycell setHidden:oldcell withShow:newcell withnum:tap.view.tag-1000-oldtag];
    int num = (int)tap.view.tag-1000-(int)oldtag;
    oldtag = tap.view.tag-1000;
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.line.frame  = CGRectMake(self.line.frame.origin.x+self.cellWidth*num, 55, self.cellWidth, 1);
                     }  completion:^(BOOL finished) {
    
                     }];
    self.view.backgroundColor= [UIColor randomColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
