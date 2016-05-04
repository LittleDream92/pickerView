//
//  MFPickerView.m
//  PickerViewDemo
//
//  Created by Meng Fan on 16/5/4.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "MFPickerView.h"

@implementation MFPickerView

-(void)awakeFromNib {
    self.dataArr = @[@"西南区",@"中央区",@"东南区",@"大西洋区",@"西北区",@"太平洋区"];
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.dataArr = @[@"西南区",@"中央区",@"东南区",@"大西洋区",@"西北区",@"太平洋区"];
    }
    return self;
}

- (IBAction)finishBtn:(id)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, 667, 375, 300);
    }];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
//    return [self.dataArr count];
    return 4;
}
//
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    return @"ni";
//}


@end
