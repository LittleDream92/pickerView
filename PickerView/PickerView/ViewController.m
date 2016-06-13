//
//  ViewController.m
//  PickerView
//
//  Created by Meng Fan on 16/6/12.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "ViewController.h"
#import "STPickerArea.h"

@interface ViewController ()<UITextFieldDelegate, STPickerAreaDelegate>

@property (weak, nonatomic) IBOutlet UITextField *areaTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.areaTextField) {
        [self.areaTextField resignFirstResponder];
        [[[STPickerArea alloc] initWithDelegate:self] show];
    }
}

#pragma mark - STPickerAreaDelegate

- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area {
    
    NSString *text = [NSString stringWithFormat:@"%@ %@ %@", province, city, area];
    self.areaTextField.text = text;
}

@end
