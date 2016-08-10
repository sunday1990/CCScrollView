//
//  SHScrollManager.h
//  SHScrollManager
//
//  Created by ccSunday on 16/8/6.
//  Copyright © 2016年 ccSunday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+frame.h"
#import "SHUnitModel.h"
#import "SHDataBaseModel.h"
#import "SHUnitView.h"

@interface SHScrollManager : NSObject
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)SHDataBaseModel *dataBase;
+ (instancetype)managerWithDataBase:(SHDataBaseModel *)dataBase;
- (void)updateWithScrollView:(UIScrollView *)scrollview;
@end
