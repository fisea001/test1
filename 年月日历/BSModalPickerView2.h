//
//  BSModalPickerView2.h
//  eOral-iPhone
//
//  Created by fisea on 16/1/11.
//  Copyright © 2016年 fisea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSModalPickerBase.h"

@interface BSModalPickerView2 : BSModalPickerBase <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic) NSUInteger indexSelectedBeforeDismissal;
@property (nonatomic) NSUInteger indexSelectedBeforeDismissalInComponent1;

@property (nonatomic) NSUInteger selectedIndex;
@property (nonatomic) NSUInteger selectedIndexInComponent1;
//是为执行频率而设计

@property (nonatomic, strong) NSString *selectedValue;

@property (nonatomic, strong) NSArray *numbers;
@property (nonatomic, strong) NSArray *units;

/* Initializes a new instance of the picker with the values to present to the user.
 (Note: call presentInView:withBlock: or presentInWindowWithBlock: to display the control)
 */
- (id)initWithNumbers:(NSArray *)numbers Flag:(NSInteger)flag;
- (id)initWithNumbers:(NSArray *)numbers Units:(NSArray *)units Flag:(NSInteger)flag;

@end
