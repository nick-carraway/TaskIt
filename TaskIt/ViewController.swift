//
//  ViewController.swift
//  TaskIt
//
//  Created by Alan Randell-Chen on 7/5/15.
//  Copyright (c) 2015 Alan Randell-Chen. All rights reserved.


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    //var taskArray : [TaskModel]  = []
    
    var baseArray: [[TaskModel]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let date1 = Date.from(year: 2011, month: 1, day: 1)
        let date2 = Date.from(year: 2012, month: 1, day: 1)
        let date3 = Date.from(year: 2013, month: 1, day: 1)
        
        let task1:TaskModel =  TaskModel(task: "Defend America", subTask: "Kill Bill", date: date1, completed: false)
        
        let task2:TaskModel =  TaskModel(task: "Defeat evil", subTask: "Combat Terminator", date: date2, completed: true)
        
        var taskArray = [task1, task2, TaskModel(task: "Exercise", subTask: "Get busy", date: date3, completed: false)]
    
        var completedArray = [TaskModel(task: "Code", subTask: "Task Project", date: date2, completed: true)]
        
        baseArray = [taskArray, completedArray]
        
        tableView.reloadData()
        
   
        
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        baseArray[0] = baseArray[0].sorted {
            (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
            
            //comparison logic here
            
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
            
            //  func sortByDate(taskOne: TaskModel, taskTwo: TaskModel) -> Bool {
            //     return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
            //}
            
            //taskArray = taskArray.sorted(sortByDate)
        }
        
        
        self.tableView.reloadData()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
        }
        
        else if segue.identifier == "showTaskAdd" {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as AddTaskViewController
            addTaskVC.mainVC = self
        }
        
        
    }
    
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
    
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    
    }
    
    
 
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    
    }
    
    // determines number of rows that should show up in the tableview
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return taskArray.count
        
        return baseArray[section].count
    }
    
    
    // which table view cell we should return for each row
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("MyCell") as TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
        
    }
    
    
    //this function would return the value of the row for each cell
    
    // protocols are defined in another class

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To Do"
        } else {
            return "Completed"
        }
    }

    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let thisTask = baseArray[indexPath.section][indexPath.row]
        var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, completed: true)
        
        baseArray[indexPath.section].removeAtIndex(indexPath.row)
    
        baseArray[1].append(newTask)
        tableView.reloadData()
        
    }
}

