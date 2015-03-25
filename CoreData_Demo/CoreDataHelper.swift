//
//  CoreDataHelper.swift
//  QzCoreData
//
//  Created by wuxing on 15/3/3.
//  Copyright (c) 2015年 优才网（www.ucai.cn）. All rights reserved.
//
import UIKit
import Foundation
import CoreData

class CoreDataHelper:NSObject
{
    let store: CoreDataStore!
    
    override init(){
        super.init()
        
        // all CoreDataHelper share one CoreDataStore defined in AppDelegate
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        self.store = appDelegate.cdstore
        println(self.store.applicationDocumentsDirectory)
    }
    
    
    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.store.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
        }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }
    
    
}