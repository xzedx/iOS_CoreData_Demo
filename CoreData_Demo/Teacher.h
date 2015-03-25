//
//  Teacher.h
//  CoreData_Demo
//
//  Created by JJ on 15/3/25.
//  Copyright (c) 2015年 JJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course;

@interface Teacher : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * from;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *courses;
@end

@interface Teacher (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(Course *)value;
- (void)removeCoursesObject:(Course *)value;
- (void)addCourses:(NSSet *)values;
- (void)removeCourses:(NSSet *)values;

@end
