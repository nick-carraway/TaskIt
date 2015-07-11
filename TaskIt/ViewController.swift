//
//  ViewController.swift
//  TaskIt
//
//  Created by Alan Randell-Chen on 7/5/15.
//  Copyright (c) 2015 Alan Randell-Chen. All rights reserved.


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var taskArray : [TaskModel]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        
        let date1 = Date.from(year: 2012, month: 1, day: 1)
        let date2 = Date.from(year: 2012, month: 1, day: 1)
        let date3 = Date.from(year: 2012, month: 1, day: 1)
        
        let task1:TaskModel =  TaskModel(task: "Defend America", subTask: "Kill Bill", date: date1)
        
        
        let task2:TaskModel =  TaskModel(task: "Defeat evil", subTask: "Combat Terminator", date: date2)

        
        taskArray = [task1, task2, TaskModel(task: "Exercise", subTask: "Get busy", date: date3)]
        
        self.tableView.reloadData()
        
   
        
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
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
            let thisTask = taskArray[indexPath!.row]
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
    
    
    // which table view cell we should return for each row
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println(indexPath.row)
        
        let thisTask = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("MyCell") as TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
        
    }
    
    
    // determines number of rows that should show up in the tableview
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    
    
    //this function would return the value of the row for each cell
    
    // protocols are defined in another class

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }
}

