//
//  leftSideOfTheSlideViewController.m
//  ACarrotAHoleDemo
//
//  Created by 联创未来 on 2017/1/12.
//  Copyright © 2017年 shaolin. All rights reserved.
//

#import "leftSideOfTheSlideViewController.h"
#import "Header.h"

@interface leftSideOfTheSlideViewController ()

@end

@implementation leftSideOfTheSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"左视图";
    self.view.backgroundColor=[UIColor greenColor];
    UIImageView *img=[[UIImageView alloc]initWithFrame:self.view.frame];
    img.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://imgsa.baidu.com/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=57463aaef71fbe090853cb460a096756/e850352ac65c10387fcecb1ab7119313b17e89b1.jpg"]]];
    [self.view addSubview:img];
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 [[self sliderViewController] hideLeft];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
