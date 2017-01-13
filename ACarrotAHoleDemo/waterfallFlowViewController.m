//
//  waterfallFlowViewController.m
//  ACarrotAHoleDemo
//
//  Created by 联创未来 on 2017/1/11.
//  Copyright © 2017年 shaolin. All rights reserved.
//

#import "waterfallFlowViewController.h"
#import "Header.h"
@interface waterfallFlowViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,CustomLayoutDelegate>
{
    NSArray *array;
}
@end

@implementation waterfallFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    array =@[@(30),@(80),@(110),@(60),@(150),@(220),@(40),@(90),@(350),@(200),@(260),@(170),@(40),@(90),@(350),@(200),@(260),@(170),@(80),@(110),@(60),@(150),@(220),@(40),@(90)];
    CustomLayout *layout =[[CustomLayout alloc]init];
    layout.delegate=self;
    self.collection_view=[[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collection_view.backgroundColor=[UIColor whiteColor];
    self.collection_view.delegate=self;
    self.collection_view.dataSource=self;
    [self.collection_view registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"123"];
    [self.view addSubview:self.collection_view];

    // Do any additional setup after loading the view.
}
//返回区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每区返回的行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return array.count;
}
//构建单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"123" forIndexPath:indexPath];
    //随机颜色
    cell.backgroundColor =[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    return cell;
}
-(CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGFloat height =[[array objectAtIndex:indexPath.row]floatValue];
    CGSize size =CGSizeMake(150, height);
    return size;
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
