//
//  Task.h
//  3 Tasks
//
//  Created by Hayden on 2014-03-27.
//  Copyright (c) 2014 Hayden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* details;

@property Boolean isCompleted;

@end
