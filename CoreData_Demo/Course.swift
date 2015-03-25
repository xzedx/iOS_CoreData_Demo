//
//  Course.swift
//  CoreData_Demo
//
//  Created by JJ on 15/3/25.
//  Copyright (c) 2015年 JJ. All rights reserved.
//

import Foundation
import CoreData
@objc(Course)
class Course: NSManagedObject {

    @NSManaged var length: NSNumber
    @NSManaged var name: String
    @NSManaged var time: NSDate
    @NSManaged var courses: Teacher

}
