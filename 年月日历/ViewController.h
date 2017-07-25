//
//  ViewController.h
//  年月日历
//
//  Created by fisea on 17/7/24.
//  Copyright © 2017年 Fisea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *yearMonthLabel;
- (IBAction)selectYearMonth:(UIButton *)sender;

@end

