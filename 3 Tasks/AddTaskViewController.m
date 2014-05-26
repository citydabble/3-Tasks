//
//  AddTaskViewController.m
//  3 Tasks
//
//  Created by Hayden on 2014-05-24.
//  Copyright (c) 2014 Hayden. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)CancelButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}


- (Task *) returnNewTaskObject {
    Task *taskObject = [[Task alloc] init];
    taskObject.title = self.TaskTitleTextField.text;
    taskObject.description = self.TaskTitleTextField.text;
    taskObject.date = self.AddTaskDatePicker.date;
    taskObject.isCompleted = NO;
    
    return taskObject;
    
    /// TODO :  Add validation that if a user enters blank info -
    /// no new object is created
}


- (IBAction)AddTaskButtonPressed:(UIButton *)sender {
    [self.delegate didAddTask:[self returnNewTaskObject]];
}
@end
