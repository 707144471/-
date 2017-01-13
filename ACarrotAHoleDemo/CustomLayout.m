//
//  CustomLayout.m
//  65瀑布流
//
//  Created by broncho on 16/3/10.
//  Copyright © 2016年 xiabeibei. All rights reserved.
//

#import "CustomLayout.h"

@implementation CustomLayout
{
    //起点
    float _x;
    //左侧 y
    float _leftY;
    //右侧
    float _rightY;
}
//相当于init
//首先，-(void)prepareLayout将被调用，默认下该方法什么没做，但是在自己的子类实现中，一般在该方法中设定一些必要的layout的结构和初始需要的参数等。
-(void)prepareLayout
{
    NSLog(@"------%s",__FUNCTION__);
    //赋值
    self.delegate =(id<CustomLayoutDelegate>)self.collectionView.delegate;
    //VIewcontroller的对象
    //self.collectionView.delegate =self;
    
    self.itemWidth =150;
    
    self.sectionInsets =UIEdgeInsetsMake(5, 5, 5, 5);
    //拿个数   self.collectionView
    //返回对应区的cell个数
    self.cellCount =[self.collectionView numberOfItemsInSection:0];
    NSLog(@"----%ld",self.cellCount);
}
//返回collectionView对应的内容尺寸
-(CGSize)collectionViewContentSize
{
    return CGSizeMake(320, _leftY>_rightY?_leftY:_rightY);
}
//返回一个装attributes的数组
//UICollectionViewLayoutAttributes 当前cell的属性
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    _x =0;
    _leftY =0;
    _rightY =0;
    //用来装attribute将来返回出去
    NSMutableArray *attributes =[NSMutableArray array];
       //从当前的colletionView上把对应的cell的attribute取出来
    for (int i=0; i<self.cellCount; i++)
    {
        NSIndexPath *indexPath =[NSIndexPath indexPathForItem:i inSection:0];
        
    UICollectionViewLayoutAttributes *attribute =[self layoutAttributesForItemAtIndexPath:indexPath];
        
        [attributes addObject:attribute];
    }
    return attributes;
 
 
}
//通过所在的indexPath确定位置。
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建一个空白的attributes
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //通过协议方法来捕捉每个cell所需要的size
    CGSize itemSize =[self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    
    CGFloat itemHeight =itemSize.height;
    /*
     位置
     x =5(左)  右:itemWidth+15
     宽:       高(y)
     */
    if (_rightY <_leftY)
    {
        //往右侧添加按钮
        _x =self.itemWidth+3*self.sectionInsets.left;
        
        _rightY +=self.sectionInsets.top;
        
         attribute.frame =CGRectMake(_x, _rightY, self.itemWidth, itemHeight);
        
        _rightY +=itemHeight;
    }
    else
    {
        //左侧
        _x =self.sectionInsets.left;
        
        _leftY +=self.sectionInsets.top;
        
        attribute.frame =CGRectMake(_x, _leftY, self.itemWidth, itemHeight);
        //记录一下当前_leftY的新值(_left+=高度)
        _leftY +=itemHeight;
    }
    return attribute;
}
@end








