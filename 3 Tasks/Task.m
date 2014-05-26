//
//  Task.m
//  3 Tasks
//
//  Created by Hayden on 2014-03-27.
//  Copyright (c) 2014 Hayden. All rights reserved.
//

#import "Task.h"

@implementation Task


//@property (nonatomic, strong) NSString* details;

//@property Boolean isCompleted;


-(id)initWithData:(NSDictionary *) data {
    self = [super init];
    if (self) {
        self.title = data[TASK_TITLE];
        self.description = data[TASK_DESCRIPTION];
        self.date = data[TASK_DATE];
        self.isCompleted = [data[TASK_COMPLETION] boolValue];
    }
    return self;
}


-(id)init {
    self = [self initWithData:nil];
    return self;
}
@end
