//
//  SHUnitView.m
//  SHScrollManager
//
//  Created by ccSunday on 16/8/6.
//  Copyright © 2016年 ccSunday. All rights reserved.
//

#import "SHUnitView.h"
#import "UIView+frame.h"
@implementation SHUnitView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame andUnitModel:(SHUnitModel *)unitModel{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

+ (instancetype)viewWithUnitModel:(SHUnitModel *)unitModel{

    return [[self alloc]initWithModel:unitModel];
}

- (instancetype)initWithModel:(SHUnitModel *)model{
    if (model.isCurrentLevel) {
        
        if (self = [super initWithFrame:CGRectMake(0, 0, model.currentRadius*2, model.currentRadius*2)]) {
       
            self.backgroundColor = [UIColor whiteColor];
        }
        
    }else{
        
        if (self = [super initWithFrame:CGRectMake(0, 0, model.normalRadius*2, model.normalRadius*2)]) {
            self.backgroundColor = [UIColor orangeColor];

        }
        
    }
//    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    self.layer.cornerRadius = self.height/2;
    self.scoreLabel.frame = CGRectMake(0, 0, self.width, 10);
//    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",(long)model.level];
    self.scoreLabel.top = self.bottom+5;
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.scoreLabel];

    return self;

}

- (UILabel *)scoreLabel{
    if (!_scoreLabel) {
        _scoreLabel = [[UILabel alloc]init];
        _scoreLabel.font = [UIFont systemFontOfSize:12];
        _scoreLabel.textColor = [UIColor darkTextColor];
        _scoreLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _scoreLabel;
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
//
//}
@end
