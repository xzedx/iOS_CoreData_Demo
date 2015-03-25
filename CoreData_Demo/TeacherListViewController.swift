//
//  TeacherListViewController.swift
//  CoreData_Demo
//
//  Created by JJ on 15/3/25.
//  Copyright (c) 2015年 JJ. All rights reserved.
//

import UIKit
import CoreData
class TeacherListViewController: UITableViewController{
    var cdh:CoreDataHelper!
    var teacherList:[AnyObject] = [AnyObject]()
    let id = "teacherCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: id)
        
        var appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        cdh = appDelegate.cdh
    }
    
    override func viewWillAppear(animated: Bool) {
        self.getTeacherList()
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier(id, forIndexPath: indexPath) as UITableViewCell
        var teacher = self.teacherList[indexPath.row] as Teacher
        cell.textLabel?.text = teacher.name        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teacherList.count
    }
    
    func getTeacherList(){
        println("========= Fetch =========")
//        var err:NSError? = nil
//        var fReq:NSFetchRequest = NSFetchRequest(entityName: "Teacher")
//        
//        fReq.predicate = NSPredicate(format: "name CONTAINS 'w' OR name CONTAINS 'W' ")
//        
//        var sorter:NSSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
//        fReq.sortDescriptors = [sorter]
//        
//        fReq.returnsObjectsAsFaults = false
//        
//        var result = self.cdh.managedObjectContext!.executeFetchRequest(fReq, error: &err)
        var error: NSError? = nil
        var fReq: NSFetchRequest = NSFetchRequest(entityName: "Teacher")
        
        fReq.predicate = NSPredicate(format:"name CONTAINS 'w' OR name CONTAINS 'W' ")
        
        var sorter: NSSortDescriptor = NSSortDescriptor(key: "name" , ascending: true)
        fReq.sortDescriptors = [sorter]
        
        fReq.returnsObjectsAsFaults = false
        
        var result = self.cdh.managedObjectContext!.executeFetchRequest(fReq, error:&error)
        for resultItem in result! {
            var teacher = resultItem as Teacher
            var t:Teacher? = teacher
            var name:String? = teacher.name
            if t != nil && name != nil {
                self.teacherList.append(teacher)
                println(name)
            }
        }
    }
}

