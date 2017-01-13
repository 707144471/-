//
//  ViewController.m
//  ACarrotAHoleDemo
//
//  Created by 联创未来 on 2017/1/11.
//  Copyright © 2017年 shaolin. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_titlesArray;

    UITableView *_tableView;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showLeftAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(showRightAction)];
    
    
    self.title=@"ACarrotAHoleDemo";
    _titlesArray=@[@"我是第一区的",@"我是第二区的"];
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[self colorWithHexString:@"#eeeeee"];//设置背景颜色
    _tableView.separatorColor=[self colorWithHexString:@"#dedede"];//设置线的颜色
    _tableView.userInteractionEnabled=YES;//设置tableView可滑动(默认yes)
    [self.view addSubview:_tableView];
    
  
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)showLeftAction
{
    [[self sliderViewController] showLeft];
}

- (void)showRightAction
{//没有设置右视图用不着
   // [[self sliderViewController] showRight];
}
//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;
}
//返回区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _titlesArray.count;
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
//设置区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
//设置区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
//设置区头视图
-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"#fb254f"];//
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    lbl.text=_titlesArray[section];
    lbl.textAlignment=NSTextAlignmentCenter;
    lbl.textColor=[self colorWithHexString:@"#2c2c2c"];
    [view addSubview:lbl];
    
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
    //将cell设置为可点击(默认yes)
   // cell.userInteractionEnabled = YES;
      cell.textLabel.text=[NSString stringWithFormat:@"我是第%ld区 第%ld行",indexPath.section,indexPath.row];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
           
             cell.textLabel.text=@"自定义瀑布流宽高";
        }else if (indexPath.row==1){
             cell.textLabel.text=@"tableView检索栏";
        }else if (indexPath.row==2){
        cell.textLabel.text=@"解析神器dome";
        }
        
    }else{
        if (indexPath.row==0) {
            cell.textLabel.text=@"烟花效果🎆";
        }else if (indexPath.row==1){
        cell.textLabel.text=@"提示信息";
        }
       

    }
    cell.textLabel.textColor=[UIColor grayColor];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    
   
    return cell;
}
//点击cell执行该方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//反选
    if (indexPath.section==0) {
        if (indexPath.row==0) {//瀑布流
            waterfallFlowViewController *waterfallFlow=[[waterfallFlowViewController alloc]init];
            [self.navigationController pushViewController:waterfallFlow animated:YES];
            
            
        }else if (indexPath.row==1){//检索栏
            IndexOfTheSideViewController *IndexOfTheSide=[[IndexOfTheSideViewController alloc]init];
            [self.navigationController pushViewController:IndexOfTheSide animated:YES];
        }else if (indexPath.row==2){//左侧花篮
            MinViewController *Min=[[MinViewController alloc]init];
            [self.navigationController pushViewController:Min animated:YES];
        }
    }else{
        if (indexPath.row==0) {//烟花
            FireworksViewController *Fireworks=[[FireworksViewController alloc]init];
            [self.navigationController pushViewController:Fireworks animated:YES];
        }else if (indexPath.row==1){//提示
            PromptInformationViewController *PromptInformation=[[PromptInformationViewController alloc]init];
            [self.navigationController pushViewController:PromptInformation animated:YES];
        }
        
    }
}

//根据UI设计师给的颜色值返回出UIColor
-(UIColor *) colorWithHexString: (NSString *)color{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] <6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] !=6)
        return [UIColor clearColor];
    NSRange range;
    range.location =0;
    range.length =2;
    NSString *rString = [cString substringWithRange:range];
    range.location =2;
    NSString *gString = [cString substringWithRange:range];
    range.location =4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r /255.0f) green:((float) g /255.0f) blue:((float) b /255.0f) alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
