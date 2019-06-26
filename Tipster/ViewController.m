//
//  ViewController.m
//  Tipster
//
//  Created by mariobaxter on 6/25/19.
//  Copyright © 2019 mariobaxter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_billField becomeFirstResponder];
    _totalLabel.alpha = 0;
    _tipLabel.alpha = 0;
    _tipAmountLabel.alpha = 0;
    _tipControl.alpha = 0;
    // Do any additional setup after loading the view.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSLog(self.billField.text);
    
    NSArray *percentages = @[@(0.15), @(0.20), @(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 60, self.billField.frame.size.width, self.billField.frame.size.height);
        
        self.tipLabel.alpha = 0;
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    
    BOOL hasNotEdited = (self.billField.text.length == 0);
    if (hasNotEdited) {
        self.billField.text = @"$0";
    }
    
    _totalLabel.alpha = 1;
    _tipLabel.alpha = 1;
    _tipAmountLabel.alpha = 1;
    _tipControl.alpha = 1;
    
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 60;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
    }];
}


@end
