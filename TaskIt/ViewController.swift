//
//  ViewController.swift
//  TaskIt
//
//  Created by Alan Randell-Chen on 7/5/15.
//  Copyright (c) 2015 Alan Randell-Chen. All rights reserved.
//  YAYAYAYAYAYAY!!!!!!
//  ARHRHRHR!!!!!

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var taskArray : [Dictionary<String, String>]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1:Dictionary<String, String> = ["task": "Defend America", "subtask" : "Kill Bill", "date" : "11/5/2014"]
        
        let task2:Dictionary<String, String> = ["task": "Conquer", "subtask" : "Destroy", "date" : "Right now!"]

        let task3:Dictionary<String, String> = ["task": "Grow", "subtask" : "Train", "date" : "ASAP"]

        
        taskArray = [task1, task2, task3]
        
        self.tableView.reloadData()
        
        println(task1["task"])
        println(task1["date"])
        
        println(task2["task"])
        println(task2["date"])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // which table view cell we should return for each row
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println(indexPath.row)
        
        let taskDict:Dictionary = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("MyCell") as TaskCell
        
        cell.taskLabel.text = taskDict["task"]
        cell.descriptionLabel.text = taskDict["subtask"]
        cell.dateLabel.text = taskDict["date"]
        
        return cell
        
    }
    
    
    // determines number of rows that should show up in the tableview
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    
    
    //this function would return the value of the row for each cell
    
    // protocols are defined in another class

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

