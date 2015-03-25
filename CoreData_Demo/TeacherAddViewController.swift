//
//  TeacherAddViewController.swift
//  CoreData_Demo
//
//  Created by JJ on 15/3/25.
//  Copyright (c) 2015年 JJ. All rights reserved.
//

import UIKit
import CoreData

class TeacherAddViewController: UIViewController {
   
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textFrom: UITextField!
    @IBOutlet weak var textBirth: UITextField!

    @IBOutlet weak var btnFinish: UIBarButtonItem!
    
    var datePicker:UIDatePicker!
    var fromPicker:UIPickerView!
    
    //CoreData helper
    var cdh:CoreDataHelper!
    
    lazy var provinces = [
        "河北省",
        "山西省",
        "辽宁省",
        "吉林省",
        "黑龙江省",
        "江苏省",
        "浙江省",
        "安徽省",
        "福建省",
        "江西省",
        "山东省",
        "河南省",
        "湖北省",
        "湖南省",
        "广东省",
        "海南省",
        "四川省",
        "贵州省",
        "云南省",
        "陕西省",
        "甘肃省",
        "青海省",
        "台湾省",
        "内蒙古自治区",
        "广西壮族自治区",
        "西藏自治区",
        "宁夏回族自治区",
        "新疆维吾尔自治区",
        "香港特别行政区",
        "澳门特别行政区"
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker(frame: CGRectMake(0, 0, 200, 200))
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.addTarget(self, action: Selector("dateValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        fromPicker = UIPickerView(frame: CGRectMake(0, 0, 200, 200))
        fromPicker.delegate = self
        fromPicker.dataSource = self
        
        textBirth.inputView = datePicker
        textFrom.inputView = fromPicker
        
        var appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        self.cdh = appDelegate.cdh
        
    }
        
    func dateValueChanged(sender:UIDatePicker){
        self.textBirth.text = (sender.date.description as NSString).substringWithRange(NSRange(location: 0, length: 10))
    }
    @IBAction func addTeacher(sender: UIBarButtonItem) {
        // 获得数据
        var teacherName = textName.text
        var teacherFrom = textFrom.text
        var teacherBirth = textBirth.text
        
        if countElements(teacherName) == 0 {
            println("input name!")
            return
        }else if countElements(teacherFrom) == 0 {
            println("input from!")
            return
        }else if countElements(teacherBirth) == 0 {
            println("input birth!")
            return
        }
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        var birthDate = formatter.dateFromString(teacherBirth)!
        
        var now = NSDate()
        var age = Int(now.timeIntervalSinceDate(birthDate) / (365*60*60*24))
        
        // 构建新Model (Entity)
        var newTeacher:Teacher = NSEntityDescription.insertNewObjectForEntityForName("Teacher", inManagedObjectContext: self.cdh.managedObjectContext!) as Teacher
        newTeacher.name = teacherName
        newTeacher.from = teacherFrom
        newTeacher.age = age
        // 保存
        cdh.saveContext()
        
        var actionSheet = UIActionSheet(title: "添加成功", delegate: nil, cancelButtonTitle: nil, destructiveButtonTitle: "确定", otherButtonTitles: "cancel")
        actionSheet.showInView(self.view)
        self.navigationController?.popViewControllerAnimated(true)
    }
}

extension TeacherAddViewController : UIPickerViewDataSource {
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return provinces.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return provinces[row]
    }
}

extension TeacherAddViewController : UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textFrom.text = provinces[row]
    }
}























