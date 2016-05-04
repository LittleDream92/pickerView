//
//  MFPickerView.h
//  PickerViewDemo
//
//  Created by Meng Fan on 16/5/4.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFPickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) NSArray *dataArr;

@end
