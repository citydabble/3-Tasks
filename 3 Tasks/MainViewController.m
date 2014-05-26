//
//  TaskViewController.m
//  3 Tasks
//
//  Created by Hayden on 2014-05-24.
//  Copyright (c) 2014 Hayden. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// == check if the instance variable exists
- (NSMutableArray *) taskObjects {
    if (!_taskObjects) {
        _taskObjects = [[NSMutableArray alloc] init];
        
    }
    return _taskObjects;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    NSArray *tasksAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:TASK_OBJECTS_KEY];
    
    for (NSDictionary *dictionary in tasksAsPropertyLists) {
        Task *taskObject = [self taskObjectForDictionary:dictionary];
        [self.taskObjects addObject:taskObject];
    }
    
    
    
}

// SEGUE //

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[AddTaskViewController class]]) {
        AddTaskViewController *addTaskViewController = segue.destinationViewController;
        addTaskViewController.delegate = self;
    }
    
    
    else if ([segue.destinationViewController isKindOfClass:[DetailsView]
        
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




- (IBAction)SortBarButtonPressed:(UIBarButtonItem *)sender {
}



- (IBAction)AddTaskBarButtonPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"MainToAddTaskSegue" sender:nil];
}




#pragma mark AddTaskViewControllerDelegate

- (void) didAddTask:(Task *)task {
    [self.taskObjects addObject:task];
    
    NSLog (@"%@", task.title);
    
    NSMutableArray *taskObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASK_OBJECTS_KEY] mutableCopy];
    if (!taskObjectsAsPropertyLists) taskObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    
    [taskObjectsAsPropertyLists addObject:[self taskObjectAsPropertyList:task]];
    
    [[NSUserDefaults standardUserDefaults] setObject:taskObjectsAsPropertyLists forKey:TASK_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    //Tell Table View to Reload Info
    [self.tableView reloadData];
}

-(void)didCancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Helper Methods

- (NSDictionary *) taskObjectAsPropertyList:(Task *)taskObject {
    NSDictionary *dictionary = @{TASK_TITLE:taskObject.title, TASK_DESCRIPTION:taskObject.description, TASK_DATE:taskObject.date, TASK_COMPLETION:@(taskObject.isCompleted)};
    return dictionary;
}

- (Task *) taskObjectForDictionary: (NSDictionary *)dictionary {
    Task *taskObject = [[Task alloc] initWithData:dictionary];
    return taskObject;
}


-(void) updateCompletionOfTask: (Task *)task forIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *taskObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASK_OBJECTS_KEY] mutableCopy];
    
    if (!taskObjectsAsPropertyLists) taskObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    [taskObjectsAsPropertyLists removeObjectAtIndex:indexPath.row];
    
    if (task.isCompleted == YES) task.isCompleted = NO;
    task.isCompleted = YES;
    
    [taskObjectsAsPropertyLists insertObject:[self taskObjectAsPropertyList:task] atIndex:indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:taskObjectsAsPropertyLists forKey:TASK_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.tableView reloadData];
}




#pragma mark UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.taskObjects count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure Cell
    
    Task *task = self.taskObjects[indexPath.row];
    cell.textLabel.text = task.title;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringFromDate = [formatter stringFromDate:task.date];
    cell.detailTextLabel.text = stringFromDate;
    
    if (task.isCompleted == YES) cell.backgroundColor = [UIColor greenColor];
    
    return cell;
    
}


#pragma mark UITableView Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Task *task = self.taskObjects[indexPath.row];
    [self updateCompletionOfTask:task forIndexPath:indexPath];
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.taskObjects removeObjectAtIndex:indexPath.row];
        
        NSMutableArray *newTaskObjectsData = [[NSMutableArray alloc] init];
        for (Task *task in self.taskObjects) {
            [newTaskObjectsData addObject:[self taskObjectAsPropertyList:task]];
        }
        
        [[NSUserDefaults standardUserDefaults] setObject:newTaskObjectsData forKey:TASK_OBJECTS_KEY];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"MainToDetailsViewControllerSegue" sender:indexPath];
}

@end
