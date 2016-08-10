//
//  SHScrollManager.m
//  SHScrollManager
//
//  Created by ccSunday on 16/8/6.
//  Copyright © 2016年 ccSunday. All rights reserved.
//

#import "SHScrollManager.h"
#import "SHScrollConfig.h"
#define padding 10
#define __weakSelf typeof(self) __weak weakSelf = self;
@interface SHScrollManager ()
@property (nonatomic, strong)SHScrollConfig *configManager;
@end

@implementation SHScrollManager
+ (instancetype)managerWithDataBase:(SHDataBaseModel *)dataBase{
    return [[self alloc]initWithDataBase:dataBase];
}

- (instancetype)initWithDataBase:(SHDataBaseModel *)dataBase{
    if (self = [super init]) {
        self.dataBase = dataBase;
        [self config];
    }
    return self;
}

- (void)config{
       for (int i = 0; i<self.dataBase.unitsArray.count; i++) {
        SHUnitModel *unitModel = self.dataBase.unitsArray[i];
       CGFloat space;
       if (self.dataBase.currentLevel == 0) {
           space = unitModel.currentRadius;
       }else{
           space = unitModel.normalRadius;
       }
        SHUnitView *unit = [SHUnitView viewWithUnitModel:unitModel];
        unit.center = CGPointMake(padding+space+self.dataBase.unitSpace*i,0);
        unit.centerY = self.scrollView.centerY;
        [self.scrollView addSubview:unit];
        [self.dataBase.viewsArray addObject:unit];
        [self.dataBase.centerXArray addObject:@(unit.centerX)];
    }

}

- (void)updateWithScrollView:(UIScrollView *)scrollview{
    [self.configManager configWithOffset:scrollview.contentOffset.x andBaseModel:_dataBase enlargeCallBack:^(NSInteger index, CGSize largeSize) {
        [self changeUnitViewFrames:index andNewSize:largeSize];

    } reduceCallBack:^(NSInteger index, CGSize reduceSize) {
        [self changeUnitViewFrames:index andNewSize:reduceSize];

    }];
}

- (void)changeUnitViewFrames:(NSInteger)index andNewSize:(CGSize)newSize{
    if (index<0||index>=self.dataBase.viewsArray.count) {
        return;
    }
    UIView *view = self.dataBase.viewsArray[index];
    view.size = newSize;
    view.layer.cornerRadius = view.height/2;
    view.centerY = self.scrollView.height/2;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 200)];
        _scrollView.backgroundColor = [UIColor greenColor];
        _scrollView.scrollEnabled = YES;
        _scrollView.contentSize = CGSizeMake(padding +self.dataBase.unitsArray.count*self.dataBase.unitSpace, 200);
        _scrollView.bounces = YES;
    }
    return _scrollView;
}


- (SHScrollConfig *)configManager{
    if (!_configManager) {
        _configManager = [[SHScrollConfig alloc]init];
    }
    return _configManager;
}

@end
