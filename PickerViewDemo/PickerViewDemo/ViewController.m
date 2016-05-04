//
//  ViewController.m
//  PickerViewDemo
//
//  Created by Meng Fan on 16/5/4.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "ViewController.h"

static NSString *const cellid = @"cellID";
@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource>
{
    NSArray *titleArr;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *finishBtn;
@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSArray *pickerDataArr;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSMutableDictionary *selectedDic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    
    [self.view insertSubview:self.bottomView atIndex:1];
    [self.bottomView addSubview:self.finishBtn];
    [self.bottomView addSubview:self.pickerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)finish {
    NSInteger index = [self.pickerView selectedRowInComponent:0];
    [self.selectedDic setObject:self.pickerDataArr[index] forKey:[NSString stringWithFormat:@"%ld", self.selectedIndex]];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.bottomView.frame = CGRectMake(0, 667, 375, 667);
                         [self.tableView reloadData];
                     }];
}

- (void)setupData {
    self.dataArr = @[@[@"奔驰", @"宝马", @"拉斯莱斯", @"奥迪", @"英菲尼迪"],
                     @[@"a", @"b", @"c", @"d"],
                     @[@"你", @"我", @"她"]];
    titleArr = @[@"品牌", @"车系", @"车型"];
    self.selectedDic = [NSMutableDictionary dictionary];
}

- (void)tapGesture {

    NSInteger index = [self.pickerView selectedRowInComponent:0];
    [self.selectedDic setObject:self.pickerDataArr[index] forKey:[NSString stringWithFormat:@"%ld", self.selectedIndex]];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.bottomView.frame = CGRectMake(0, 667, 375, 667);
                         [self.tableView reloadData];
                     }];
}

#pragma mark - setting and getting
-(UIView *)bottomView {
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 667, 375, 667)];
        _bottomView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
        [_bottomView addGestureRecognizer:tap];
    }
    return _bottomView;
}

-(UIButton *)finishBtn {
    if (_finishBtn == nil) {
        _finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _finishBtn.frame = CGRectMake(375-100, 667-250-50, 100, 40);
        _finishBtn.backgroundColor = [UIColor blueColor];
        [_finishBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_finishBtn addTarget:self action:@selector(finish) forControlEvents:UIControlEventTouchUpInside];
    }
    return _finishBtn;
}

-(UIPickerView *)pickerView {
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 667-250, 375, 250)];
        _pickerView.backgroundColor = [UIColor cyanColor];
        
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    return _pickerView;
}

#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.pickerDataArr count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.pickerDataArr[row];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellid];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = titleArr[indexPath.row];
    
    NSLog(@"%@", self.selectedDic);
    if ([self.selectedDic objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]]) {
        NSLog(@"yes:%@", [self.selectedDic objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]]);
        cell.detailTextLabel.text = [self.selectedDic objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]];
    }else {
        NSLog(@"no");
        cell.detailTextLabel.text = @"请选择";
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.pickerDataArr = self.dataArr[indexPath.row];
    self.selectedIndex = indexPath.row;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.bottomView.frame = CGRectMake(0, 0, 375, 667);
                         [self.pickerView selectRow:0 inComponent:0 animated:NO];
                         [self.pickerView reloadAllComponents];
                     }];
}

@end
