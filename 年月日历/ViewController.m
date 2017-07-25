//
//  ViewController.m
//  年月日历
//
//  Created by fisea on 17/7/24.
//  Copyright © 2017年 Fisea. All rights reserved.
//
#define IS_IPHONE   [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define IS_IPHONE_4 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )480) < DBL_EPSILON )
#import "ViewController.h"
#import "BSModalPickerView2.h"
@interface ViewController ()
{
    BSModalPickerView2 *yearMonthPicker;

}
@end

@implementation ViewController
int const taskCompletionRateBasicYear=2010;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *yearArray=[[NSMutableArray alloc] init];
    for (int i=0; i<=50; i++) {
        [yearArray addObject:[[NSNumber numberWithInt:taskCompletionRateBasicYear+i] stringValue]];
    }
    NSMutableArray *monthArray=[[NSMutableArray alloc] init];
    int basicMonth=1;
    for (int j=0; j<12; j++) {
        [monthArray addObject:[[NSNumber numberWithInt:basicMonth+j] stringValue]];
    }
    yearMonthPicker=[[BSModalPickerView2 alloc] initWithNumbers:yearArray Units:monthArray Flag:1];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)selectYearMonth:(UIButton *)sender {
    NSString *curYearMonthStr=_yearMonthLabel.text;
    NSArray *sepArray=[curYearMonthStr componentsSeparatedByString:@"-"];
    yearMonthPicker.selectedIndex = [sepArray[0] integerValue]-taskCompletionRateBasicYear;
    yearMonthPicker.selectedIndexInComponent1 = [sepArray[1] integerValue]-1;
    yearMonthPicker.indexSelectedBeforeDismissal=yearMonthPicker.selectedIndex;
    yearMonthPicker.indexSelectedBeforeDismissalInComponent1=yearMonthPicker.selectedIndexInComponent1;
    if(IS_IPHONE&&IS_IPHONE_4)
    {
        yearMonthPicker.transform=CGAffineTransformMakeRotation(M_PI/2);//旋转90度，在真机上必须加上这句，模拟器上不需要，为什么？？
    }
    [yearMonthPicker presentInWindowWithBlock:^(BOOL madeChoice) {
        if (madeChoice) {
            self.yearMonthLabel.text=yearMonthPicker.selectedValue;
        }
    }];
}
@end
