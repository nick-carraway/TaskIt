//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Alan Randell-Chen on 7/8/15.
//  Copyright (c) 2015 Alan Randell-Chen. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    var mainVC: ViewController!
    
    var detailTaskModel: TaskModel!
    
    @IBOutlet weak var taskTextField: UITextField!
    
    @IBOutlet weak var subtaskTextField: UITextField!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.taskTextField.text = detailTaskModel.task
        self.subtaskTextField.text = detailTaskModel.subTask
        self.dueDatePicker.date = detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
        

        
    }
 

}
