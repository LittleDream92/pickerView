//
//  ViewController.h
//  PickerView-1
//
//  Created by Meng Fan on 16/3/24.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *areaArr;
    NSMutableArray *teamArr;
}


@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (weak, nonatomic) IBOutlet UITextField *areaTextField;


@end

