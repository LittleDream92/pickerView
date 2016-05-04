//
//  ViewController.m
//  PickerView-1
//
//  Created by Meng Fan on 16/3/24.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self data];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - data
- (void)data
{
    areaArr=@[@"西南区",@"中央区",@"东南区",@"大西洋区",@"西北区",@"太平洋区"];
    teamArr=[[NSMutableArray alloc] init];
    [teamArr addObject:@[@"马刺",@"灰熊",@"小牛",@"火箭",@"鹈鹕"]];
    [teamArr addObject:@[@"活塞",@"步行者",@"骑士",@"公牛",@"雄鹿"]];
    [teamArr addObject:@[@"热火",@"魔术",@"老鹰",@"奇才",@"黄蜂"]];
    [teamArr addObject:@[@"凯尔特人",@"76人",@"尼克斯",@"篮网",@"猛龙"]];
    [teamArr addObject:@[@"森林狼",@"掘金",@"爵士",@"开拓者",@"雷霆"]];
    [teamArr addObject:@[@"国王",@"太阳",@"湖人",@"快船",@"勇士"]];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    //判断列
    if (component==0) {
        return [areaArr count];
    }else{
        //判断0列中当前的行号
        NSInteger  currentRow=[pickerView selectedRowInComponent:0];
        return [teamArr[currentRow] count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component==0) {
        //o列从区域数组中选择
        return areaArr[row];
    }else{
        //根据0列中选择的行号
        NSInteger  currentRow=[pickerView selectedRowInComponent:0];
        return teamArr[currentRow][row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [pickerView reloadComponent:1];
    NSInteger areaRow=[pickerView selectedRowInComponent:0];
    NSInteger teamRow=[pickerView selectedRowInComponent:1];
    [_areaTextField setText:[NSString stringWithFormat:@"%@-%@",areaArr[areaRow],teamArr[areaRow][teamRow]]];
}

@end
