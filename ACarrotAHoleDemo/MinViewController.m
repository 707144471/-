//
//  MinViewController.m
//  ACarrotAHoleDemo
//
//  Created by 联创未来 on 2017/1/12.
//  Copyright © 2017年 shaolin. All rights reserved.
//

#import "MinViewController.h"
#import "Header.h"
#import "ZYSliderViewController.h"
#import "UIViewController+ZYSliderViewController.h"
#import "DataModels.h"
@interface MinViewController ()

@end

@implementation MinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"主视图";
    self.view.backgroundColor=[UIColor whiteColor];
    [minAFNetworking obtainDatablock:^(NSDictionary *dic) {
        [self nslong:dic];
    }];
 
    // Do any additional setup after loading the view.
}
-(void)nslong:(NSDictionary *)dic{
  //  BaseClass *base=[[BaseClass alloc]initWithDictionary:dic];
    Data *dicdata=[[Data alloc]initWithDictionary:[dic objectForKey:@"data"]];

    if (dicdata.provinceId==nil) {//如果没有值会进入到这
        NSLog(@"qqqqqqqqqqq-*-*-*");
    }
    UIImageView *img=[[UIImageView alloc]initWithFrame:self.view.frame];
    if (dicdata.company.introImgs.count>0) {
        img.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dicdata.company.introImgs[0]]]];
    }
    
    [self.view addSubview:img];
   
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
