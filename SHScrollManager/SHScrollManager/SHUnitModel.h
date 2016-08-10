//
//  SHUnitModel.h
//  SHScrollManager
//
//  Created by ccSunday on 16/8/6.
//  Copyright © 2016年 ccSunday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SHUnitModel : NSObject
/**
 *  星级
 */
@property (nonatomic, assign)NSInteger level;
/**
 *  分数
 */
@property (nonatomic, assign)NSInteger scroes;
/**
 *  头像
 */
@property (nonatomic, strong)UIImage *headImg;
/**
 * 当前星级
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
/**
 *  是否是当前星级
 */
@property (nonatomic, assign)BOOL isCurrentLevel;

@end
