//
//  IndexOfTheSideViewController.m
//  ACarrotAHoleDemo
//
//  Created by 联创未来 on 2017/1/12.
//  Copyright © 2017年 shaolin. All rights reserved.
//

#import "IndexOfTheSideViewController.h"
#import "Header.h"
#import "LGUIView.h"
@interface IndexOfTheSideViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    LGUIView * lgView;
    UITableView * _tableView;
}

@end

@implementation IndexOfTheSideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"检索栏";
    self.view.backgroundColor=[UIColor whiteColor];
    [self creatTableView];
    [self creatLGView];

    // Do any additional setup after loading the view.
}
-(void)creatTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH - 40, HEIGHT - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
}

-(void)creatLGView
{
    NSMutableArray * arr = [NSMutableArray new];
    for (int i = 0; i < 26; i ++)
    {
        unichar ch = 65 + i;
        NSString * str = [NSString stringWithUTF8String:(char *)&ch];
        NSLog(@"-----%@",str);
        [arr addObject:str];
    }
    
    lgView = [[LGUIView alloc]initWithFrame:CGRectMake(WIDTH - 40, 100, 40, HEIGHT - 140) indexArray:arr];
    [self.view addSubview:lgView];
    
    [lgView selectIndexBlock:^(NSInteger section)
     {
         [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]
                                 animated:NO
                           scrollPosition:UITableViewScrollPositionTop];
     }];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    unichar ch = 65 + section;
    NSString * str = [NSString stringWithUTF8String:(char *)&ch];
    return str;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 26;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    UITableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithRed:35/255.0 green:94/255.0 blue:44/255.0 alpha:1.0];
    
    return cell;
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
