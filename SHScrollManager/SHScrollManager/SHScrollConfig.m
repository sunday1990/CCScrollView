//
//  SHScrollConfig.m
//  SHScrollManager
//
//  Created by ccSunday on 16/8/6.
//  Copyright © 2016年 ccSunday. All rights reserved.
//

#import "SHScrollConfig.h"

#define WIDTH 500;

@implementation SHScrollConfig

#pragma mark 添加观察者

- (void)sharedObservation{
    static  dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    [self addObserver:self forKeyPath:@"offsetX" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    });
}

- (void)configWithOffset:(CGFloat)offset andBaseModel:(SHDataBaseModel *)baseModel enlargeCallBack:(void (^)(NSInteger, CGSize))largeCallBack reduceCallBack:(void (^)(NSInteger, CGSize))reduceCallBack{
    self.offsetX = offset;
    [self sharedObservation];
    [self configTheNearestViewWithOffset:offset BaseModel:baseModel andCallBack:^(NSInteger index, BOOL isEnlarge,CGSize newSize) {
        if (isEnlarge) {
            largeCallBack(index,newSize);
            reduceCallBack(index-1,CGSizeMake(2*(baseModel.currentRadius+baseModel.normalRadius-newSize.height/2),2*(baseModel.currentRadius+baseModel.normalRadius-newSize.height/2)));
        }else{
            largeCallBack(index,newSize);
            reduceCallBack(index+1,CGSizeMake(2*(baseModel.currentRadius+baseModel.normalRadius-newSize.height/2),2*(baseModel.currentRadius+baseModel.normalRadius-newSize.height/2)));
        }
    }];

}

#pragma mark 获取当前最靠近中心点的view下标，及放大或缩小的标志位，以及它实时的size
/**
 *
 *
 *  @param offset 偏移量
 *  @param centerXArray 中心点数组
 *  @param block  参数回调
 */
- (void)configTheNearestViewWithOffset:(CGFloat)offset BaseModel:(SHDataBaseModel *)baseModel andCallBack:(void(^)(NSInteger index,BOOL isEnlarge,CGSize newSize))block{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            float min = 100000;
            float temp = 0.0;
            int minIndex = 0;
            for (int i = 0 ; i<baseModel.centerXArray.count; i++) {
                float a;
                a = [baseModel.centerXArray[i]floatValue]-offset;
                temp = fabs(a-[UIScreen mainScreen].bounds.size.width/2);
                if (temp<min) {
                    min = temp;
                    minIndex = i;
                }
            }
            CGSize nearestSize = [self getSizeOfNearstWithModel:baseModel andMinSpace:min];
            dispatch_async(dispatch_get_main_queue(), ^{
                block(minIndex,rightDir,nearestSize);
            });
    });
}

#warning 高度有问题
- (CGSize)getSizeOfNearstWithModel:(SHDataBaseModel *)dataBase andMinSpace:(CGFloat)min{
    
    CGFloat H =(dataBase.unitSpace-min)*(dataBase.currentRadius-dataBase.normalRadius)/dataBase.unitSpace+dataBase.normalRadius;
    return CGSizeMake(2*H, 2*H);
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"offsetX"]) {
        CGFloat oldOffsetX = [change[@"old"] floatValue];
        CGFloat newOffsetX = [change[@"new"] floatValue];
        CGFloat dis = newOffsetX - oldOffsetX;
        if (dis>0) {//向右滑动
            rightDir = YES;
        }else{      //向左滑动
            rightDir = NO;
        }
    }
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"contentX" context:nil];
}
@end
