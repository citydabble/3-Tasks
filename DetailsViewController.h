//
//  DetailsViewController.h
//  3 Tasks
//
//  Created by Hayden on 2014-05-24.
//  Copyright (c) 2014 Hayden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) Task *task;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *AllTasksButtonPressed;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *EditTaskButtonPressed;
@property (strong, nonatomic) IBOutlet UILabel *TaskTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *TaskDueDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *TaskDescriptionLabel;

@end
