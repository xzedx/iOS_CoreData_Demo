//
//  Course.h
//  CoreData_Demo
//
//  Created by JJ on 15/3/25.
//  Copyright (c) 2015年 JJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Course : NSManagedObject

@property (nonatomic, retain) NSNumber * length;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSManagedObject *courses;

@end
