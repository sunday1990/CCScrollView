//
//  ViewController.m
//  SHScrollManager
//
//  Created by ccSunday on 16/8/6.
//  Copyright © 2016年 ccSunday. All rights reserved.
//

#import "ViewController.h"
#import "SHScrollManager.h"
#import "SHUnitModel.h"
#import "SHDataBaseModel.h"
@interface ViewController ()<UIScrollViewDelegate>
{
    SHScrollManager *manager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SHDataBaseModel *dataBase  = [[SHDataBaseModel alloc]init];
     ;
    dataBase.unitSpace = ([UIScreen mainScreen].bounds.size.width-20)/3;
    dataBase.normalRadius = 30;
    dataBase.currentRadius = 45;
    for (int i = 0; i<10;i++) {
        SHUnitModel *model = [[SHUnitModel alloc]init];
        model.level = i;
        model.scroes = i;
        if (i == 5) {
            model.isCurrentLevel = YES;
            model.currentRadius = 45;
            model.currentLevel = i;
            dataBase.currentLevel = i;
        }else{
            model.normalRadius = 30;
        }
        [dataBase.unitsArray addObject:model];
    }    
    manager = [SHScrollManager managerWithDataBase:dataBase];
    manager.scrollView.left = 0;
    manager.scrollView.top = 100;
    manager.scrollView.delegate = self;
    [self.view addSubview:manager.scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [manager updateWithScrollView:scrollView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
