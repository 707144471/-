//
//  CustomLayout.h
//  65瀑布流
//
//  Created by broncho on 16/3/10.
//  Copyright © 2016年 xiabeibei. All rights reserved.
//

#import <UIKit/UIKit.h>
//开启代理的主要用途就是为了获得每个cell对应的高度
@protocol CustomLayoutDelegate <NSObject>

@required

-(CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath;

@end

//如果自定义表明当前layout是完全重新绘制的 一定要实现对应的属性
@interface CustomLayout : UICollectionViewLayout
//定义拥有的属性
//宽度
@property(nonatomic,assign)NSInteger itemWidth;
//数量>>>单元格
@property(nonatomic,assign)NSInteger cellCount;
//区域部分 left  top  right buttom
@property(nonatomic,assign)UIEdgeInsets sectionInsets;

@property(nonatomic,assign)id<CustomLayoutDelegate>delegate;
@end







