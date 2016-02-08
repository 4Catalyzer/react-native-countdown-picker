//
//  CJCountDownPicker.m
//  CJCountDownPicker
//
//  Created by Chirag Jain on 2/8/16.
//  Copyright © 2016 Chirag Jain. All rights reserved.
//

#import "CJCountDownPicker.h"

#import "RCTConvert.h"
#import "RCTLog.h"
#import "RCTUtils.h"

#import "ActionSheetDatePicker.h"

@implementation CJCountDownPicker

RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(showCountDownPickerWithOptions:(NSDictionary *)options
                  callback:(RCTResponseSenderBlock)callback)
{
    UIViewController *controller = RCTKeyWindow().rootViewController;
    if (controller == nil) {
        RCTLogError(@"Tried to display action sheet but there is no application window. options: %@", options);
        return;
    }
    UIView *sourceView = controller.view;
    
    NSString * title = @"";
    if (options[@"title"]) {
        title = [RCTConvert NSString:options[@"title"]];
    }
    
    void(^doneBlock)(ActionSheetDatePicker *, id, id) = ^(ActionSheetDatePicker *picker, id selectedDate, id origin) {
        callback(@[[NSNull null] , selectedDate]);
    };
    
    void(^cancelBlock)(ActionSheetDatePicker *) = ^(ActionSheetDatePicker *picker) {
        callback(@[@YES]);
    };
    
    ActionSheetDatePicker *datePicker = [[ActionSheetDatePicker alloc] initWithTitle:title
                                                                      datePickerMode:UIDatePickerModeCountDownTimer
                                                                        selectedDate:nil
                                                                           doneBlock:doneBlock
                                                                         cancelBlock:cancelBlock
                                                                              origin:sourceView];
    
    if (options[@"countDownDuration"]) {
        datePicker.countDownDuration = [RCTConvert double:options[@"countDownDuration"]];
    }
    [datePicker showActionSheetPicker];
}

@end