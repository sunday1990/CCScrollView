//
//  SHDataBaseModel.h
//  SHScrollManager
//
//  Created by ccSunday on 16/8/6.
//  Copyright © 2016年 ccSunday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHUnitModel.h"
@interface SHDataBaseModel : NSObject
/**
 *  存放unitmodel的数组
 */
@property (nonatomic, strong)NSMutableArray *unitsArray;
/**
 *  存放unitview的数组
 */
@property (nonatomic, strong)NSMutableArray *viewsArray;
/**
 *  存放view的中心点的X坐标的数组
 */
@property (nonatomic, strong)NSMutableArray *centerXArray;

/**
 *  两个单元之间的距离
 */
@property (nonatomic, assign)CGFloat unitSpace;
/**
 *  当前默认选中的level
 */
@property (nonatomic, assign)NSInteger currentLevel;

/**
 * 正常星级的半径
 */
@property (nonatomic, assign)CGFloat normalRadius;
/**
 *  选中星级的半径
 */
@property (nonatomic, assign)CGFloat currentRadius;
@end
