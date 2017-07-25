//
//  BSModalPickerView2.m
//  eOral-iPhone
//
//  Created by fisea on 16/1/11.
//  Copyright © 2016年 fisea. All rights reserved.
//

#import "BSModalPickerView2.h"

@interface BSModalPickerView2 ()
@property (nonatomic) NSInteger flag;
//@property (nonatomic) NSUInteger indexSelectedBeforeDismissalInComponent2;
//@property (nonatomic) NSUInteger indexSelectedBeforeDismissalInComponent3;
@end

@implementation BSModalPickerView2

#pragma mark - Designated Initializer

- (id)initWithNumbers:(NSArray *)numbers  Flag:(NSInteger)flag {
    self = [super init];
    if (self) {
        self.numbers = numbers;
        //self.units=units;
        self.flag=flag;
        self.userInteractionEnabled = YES;
    }
    return self;
}
- (id)initWithNumbers:(NSArray *)numbers Units:(NSArray *)units Flag:(NSInteger)flag
{
    self = [self initWithNumbers:numbers Flag:flag];
    if (self) {
        self.units=units;
    }
    return self;
}
#pragma mark - Custom Getters

- (UIView *)pickerWithFrame:(CGRect)pickerFrame {
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    pickerView.showsSelectionIndicator = YES;
    [pickerView selectRow:self.selectedIndex inComponent:0 animated:NO];
    if (self.flag==1) {
       [pickerView selectRow:self.selectedIndexInComponent1 inComponent:1 animated:NO];
    }
    return pickerView;
}

- (NSString *)selectedValue {
    //return [self.values objectAtIndex:self.selectedIndex];
       if (self.flag==1) {
        NSString* formatter=@"%@-%@";
        /*if ([CurrentLanguage isEqual:@"en"]) {
            formatter=@"%@ %@";
        }*/
        return  [NSString stringWithFormat:formatter,(NSString *)[self.numbers objectAtIndex:self.selectedIndex],(NSString *)[self.units objectAtIndex:self.selectedIndexInComponent1]];
    }
    return  (NSString *)[self.numbers objectAtIndex:self.selectedIndex];
}

#pragma mark - Custom Setters

/*- (void)setNumbers:(NSArray *)numbers {
    _numbers = numbers;
    if (_numbers) {
        if (_picker) {
            UIPickerView *pickerView = (UIPickerView *)_picker;
            [pickerView reloadComponent:0];
            self.selectedIndex = 0;
        }
    }
}
- (void)setUnits:(NSArray *)units {
    _units = units;
    if (_units) {
        if (_picker) {
            UIPickerView *pickerView = (UIPickerView *)_picker;
            [pickerView reloadComponent:1];
            self.selectedIndexInComponent1 = 0;
        }
    }
}
- (void)setFrequencyNumbers:(NSArray *)frequencyNumbers {
    _frequencyNumbers = frequencyNumbers;
    if (_frequencyNumbers) {
        if (_picker) {
            UIPickerView *pickerView = (UIPickerView *)_picker;
            [pickerView reloadComponent:2];
            self.selectedIndexInComponent2 = 0;
        }
    }
}
- (void)setFrequencyUnits:(NSArray *)frequencyUnits {
    _frequencyUnits = frequencyUnits;
    if (_frequencyUnits) {
        if (_picker) {
            UIPickerView *pickerView = (UIPickerView *)_picker;
            [pickerView reloadComponent:3];
            self.selectedIndexInComponent3 = 0;
        }
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if (_selectedIndex != selectedIndex) {
        _selectedIndex = selectedIndex;
        if (self.picker) {
            UIPickerView *pickerView = (UIPickerView *)self.picker;
            [pickerView selectRow:selectedIndex inComponent:0 animated:YES];
        }
    }
}

- (void)setSelectedIndexInComponent1:(NSUInteger)selectedIndexInComponent1 {
    if (_selectedIndexInComponent1 != selectedIndexInComponent1) {
        _selectedIndexInComponent1 = selectedIndexInComponent1;
        if (self.picker) {
            UIPickerView *pickerView = (UIPickerView *)self.picker;
            [pickerView selectRow:selectedIndexInComponent1 inComponent:1 animated:YES];
        }
    }
}
- (void)setSelectedIndexInComponent2:(NSUInteger)selectedIndexInComponent2 {
    if (_selectedIndexInComponent2 != selectedIndexInComponent2) {
        _selectedIndexInComponent2 = selectedIndexInComponent2;
        if (self.picker) {
            UIPickerView *pickerView = (UIPickerView *)self.picker;
            [pickerView selectRow:selectedIndexInComponent2 inComponent:2 animated:YES];
        }
    }
}
- (void)setSelectedIndexInComponent3:(NSUInteger)selectedIndexInComponent3 {
    if (_selectedIndexInComponent3 != selectedIndexInComponent3) {
        _selectedIndexInComponent3 = selectedIndexInComponent3;
        if (self.picker) {
            UIPickerView *pickerView = (UIPickerView *)self.picker;
            [pickerView selectRow:selectedIndexInComponent3 inComponent:3 animated:YES];
        }
    }
}*/
//TODO
- (void)setSelectedValue:(NSString *)selectedValue {
    NSInteger index = [self.numbers indexOfObject:selectedValue];
    [self setSelectedIndex:index];
}


#pragma mark - Event Handler

- (void)onDone:(id)sender {
    self.selectedIndex = self.indexSelectedBeforeDismissal;
    if (self.flag==1) {
        self.selectedIndexInComponent1=self.indexSelectedBeforeDismissalInComponent1;
    }
    [super onDone:sender];
}

-(void)onCancel:(id)sender
{
    [super onCancel:sender];
}
#pragma mark - Picker View Data Source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (self.flag==1)
        return 2;
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component==0) {
        return self.numbers.count;
    }
    else if(component==1)
    {
        return self.units.count;
    }
   return 0;
}

#pragma mark - Picker View Delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component==0) {
         return (NSString *)[self.numbers objectAtIndex:row];
    }
    else if(component==1)
    {
        return [self.units objectAtIndex:row];
    }
   return nil;
   
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component==0) {
        self.indexSelectedBeforeDismissal = row;
    }
    else if (component==1)
    {
        self.indexSelectedBeforeDismissalInComponent1=row;
    }
}

@end
