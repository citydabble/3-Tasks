//
//  TaskViewController.h
//  3 Tasks
//
//  Created by Hayden on 2014-05-24.
//  Copyright (c) 2014 Hayden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTaskViewController.h"
#import "DetailsViewController.h"


@interface MainViewController : UIViewController <AddTaskViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
- (IBAction)SortBarButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)AddTaskBarButtonPressed:(UIBarButtonItem *)sender;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *taskObjects;

@end
