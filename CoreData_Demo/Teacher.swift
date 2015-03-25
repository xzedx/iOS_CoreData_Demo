//
//  Teacher.swift
//  CoreData_Demo
//
//  Created by JJ on 15/3/25.
//  Copyright (c) 2015年 JJ. All rights reserved.
//

import Foundation
import CoreData
@objc(Teacher)
class Teacher: NSManagedObject {

    @NSManaged var age: NSNumber
    @NSManaged var from: String
    @NSManaged var name: String
    @NSManaged var courses: NSSet

}
