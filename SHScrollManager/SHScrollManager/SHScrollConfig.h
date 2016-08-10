//
//  SHScrollConfig.h
//  SHScrollManager
//
//  Created by ccSunday on 16/8/6.
//  Copyright © 2016年 ccSunday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHScrollManager.h"
#import "SHDataBaseModel.h"
#import "SHUnitModel.h"
#import "SHUnitView.h"
@interface SHScrollConfig : NSObject
{
    BOOL rightDir;//向右
}

@property (nonatomic, assign)CGFloat offsetX;

- (void)configWithOffset:(CGFloat)offset andBaseModel:(SHDataBaseModel *)baseModel enlargeCallBack:(void (^)(NSInteger index, CGSize largeSize))largeCallBack reduceCallBack:(void (^)(NSInteger index, CGSize reduceSize))reduceCallBack;

@end
