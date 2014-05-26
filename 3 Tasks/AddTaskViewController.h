//
//  AddTaskViewController.h
//  3 Tasks
//
//  Created by Hayden on 2014-05-24.
//  Copyright (c) 2014 Hayden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@protocol AddTaskViewControllerDelegate <NSObject>

-(void)didCancel;
-(void)didAddTask:(Task *)task;

@end


@interface AddTaskViewController : UIViewController


- (IBAction)CancelButtonPressed:(UIButton *)sender;
- (IBAction)AddTaskButtonPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UITextField *TaskTitleTextField;
@property (strong, nonatomic) IBOutlet UITextView *TaskTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *AddTaskDatePicker;

@property (weak, nonatomic) id <AddTaskViewControllerDelegate> delegate;

@end
