//
//  TaskModel.swift
//  TaskIt
//
//  Created by Alan Randell-Chen on 7/12/15.
//  Copyright (c) 2015 Alan Randell-Chen. All rights reserved.
//

import Foundation
import CoreData

@objc (TaskModel)

class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
