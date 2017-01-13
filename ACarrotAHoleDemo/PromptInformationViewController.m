//
//  PromptInformationViewController.m
//  ACarrotAHoleDemo
//
//  Created by 联创未来 on 2017/1/12.
//  Copyright © 2017年 shaolin. All rights reserved.
//

#import "PromptInformationViewController.h"
#import "FTIndicator.h"

#import "FTToastIndicator.h"
#import "FTProgressIndicator.h"
#import "FTNotificationIndicator.h"
@interface PromptInformationViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_titlesArray;
    
    UITableView *_tableView;
}
@property (nonatomic, strong)UIImageView *backgroudImage;
@end

@implementation PromptInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"提示信息";
    self.view.backgroundColor=[UIColor whiteColor];
 
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.backgroundColor=[UIColor clearColor];
    _tableView.dataSource=self;
    _tableView.userInteractionEnabled=YES;//设置tableView可滑动(默认yes)
    [self.view addSubview:_tableView];

    
    
 
    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [FTIndicator dismissProgress];
    
}
//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
//返回区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
//设置区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
//设置区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
//设置区头视图
-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
  
    
    return view;
}
//设置区尾视图
-(nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor clearColor];//透明颜色
    return view;
}
//设置cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str=@"indexpath";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
  
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text=@"开始转圈";
        }
            break;
        case 1:
        {
            cell.textLabel.text=@"停止转圈";
        }
            break;
        case 2:
        {
            cell.textLabel.text=@"顶部出现(有图片)";
        }
            break;
        case 3:
        {
            cell.textLabel.text=@"顶部出现(无图片)";
        }
            break;
        case 4:
        {
             cell.textLabel.text=@"弹框对号";
        }
            break;
        case 5:
        {
             cell.textLabel.text=@"弹框感叹号";
        }
            break;
        case 6:
        {
             cell.textLabel.text=@"弹框感叉号";
        }
            break;
        case 7:
        {
             cell.textLabel.text=@"弹框提示信息";
        }
            break;
      
        default:
            break;
    }
    cell.textLabel.textColor=[UIColor grayColor];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    
    
    return cell;
}
//点击cell执行该方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//反选
    switch (indexPath.row) {
        case 0:
        {
           [FTIndicator showProgressWithmessage:@"开始转圈了"];
        }
            break;
        case 1:
        {
            [FTIndicator dismissProgress];//停止转圈
        }
            break;
        case 2:
        {
            //FFTspark从顶部出现,带标题,带提示信息
            [FTIndicator showNotificationWithImage:[UIImage imageNamed:@"FFTspark"]
                                             title:@"我是标题"
                                           message:@"我是提示信息"];
        }
            break;
        case 3:
        {
            //从顶部弹出有标题跟提示信息
            [FTIndicator showNotificationWithTitle:@"Here is a notification title."
                                           message:@"Here is a notification message. Try to swipe it up or tap at 'Dismiss Notification' cell"];
        }
            break;
        case 4:
        {
            //弹框对号用户成功
            [FTIndicator showSuccessWithMessage:@"Here is a progress title. This means nothing at all."];
        }
            break;
        case 5:
        {
            //弹框感叹号
            [FTIndicator showInfoWithMessage:@"Here is a progress title. This means nothing at all."];
            
        }
            break;
        case 6:
        {
            //弹框叉号
            [FTIndicator showErrorWithMessage:@"Here is a progress title. This means nothing at all."];
            
        }
            break;
        case 7:
        {
            //弹框提示信息
              [FTIndicator showToastMessage:@"Here is a long long toast message, see if it can break lines."];
        }
            break;
       
        default:
            break;
    }
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
