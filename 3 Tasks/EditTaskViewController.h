//
//  EditTaskViewController.h
//  3 Tasks
//
//  Created by Hayden on 2014-05-24.
//  Copyright (c) 2014 Hayden. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditTaskViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *EditTaskTitleTextField;
@property (strong, nonatomic) IBOutlet UITextView *EditTaskTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *EditTaskDatePicker;
- (IBAction)SaveTaskBarButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)CancelTaskBarButtonPressed:(UIBarButtonItem *)sender;

@end
