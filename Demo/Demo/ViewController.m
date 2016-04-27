//
//  ViewController.m
//  Demo
//
//  Created by 海尔冰箱－智慧小微 on 16/4/27.
//  Copyright © 2016年 com.yinqixing.YXProgressView. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YYAdd.h"
#import "YXProgressView.h"
@interface ViewController ()
@property (nonatomic,strong) YXProgressView *myProgressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    _myProgressView = [[YXProgressView alloc] initWithFrame:CGRectMake(0, 100, 80, 80)];
    _myProgressView.centerX = self.view.centerX;
    [self.view addSubview:_myProgressView];
    
    UISlider *mySlider =  [[UISlider alloc]initWithFrame:CGRectMake(0, 350, 300, 100)];
    mySlider.centerX = self.view.centerX;
    [mySlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:mySlider];

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)sliderValueChanged:(UISlider *)sender{
    NSLog(@"%f",sender.value);
    _myProgressView.progress = sender.value;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
