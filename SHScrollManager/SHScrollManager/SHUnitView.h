//
//  SHUnitView.h
//  SHScrollManager
//
//  Created by ccSunday on 16/8/6.
//  Copyright © 2016年 ccSunday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHUnitModel.h"
@interface SHUnitView : UIImageView

@property (nonatomic, strong)UILabel *scoreLabel;

- (id)initWithFrame:(CGRect)frame andUnitModel:(SHUnitModel *)unitModel;

+ (instancetype)viewWithUnitModel:(SHUnitModel *)unitModel;
@end
