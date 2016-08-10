//
//  SHDataBaseModel.m
//  SHScrollManager
//
//  Created by ccSunday on 16/8/6.
//  Copyright © 2016年 ccSunday. All rights reserved.
//

#import "SHDataBaseModel.h"

@implementation SHDataBaseModel
- (NSMutableArray *)unitsArray{
    if (!_unitsArray) {
        _unitsArray = [NSMutableArray array];
    }
    return _unitsArray;
}

- (NSMutableArray *)viewsArray{
    if (!_viewsArray) {
        _viewsArray = [NSMutableArray array];
    }
    return _viewsArray;
}

- (NSMutableArray *)centerXArray{
    if (!_centerXArray) {
        _centerXArray = [NSMutableArray array];
    }
    return _centerXArray;
}

@end
