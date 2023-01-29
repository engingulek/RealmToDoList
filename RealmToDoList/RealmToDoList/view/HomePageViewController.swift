//
//  ViewController.swift
//  RealmToDoList
//
//  Created by engin gülek on 29.01.2023.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var newTaskTxtField: UITextField!
    @IBOutlet weak var taskTableViewController: UITableView!
    
    @IBOutlet weak var addTaskButton: UIButton!
    var taskViewModel = TaskListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableViewController.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "taskCell")
        taskViewModel.getTask()
    }


    @IBAction func addTaskAction(_ sender: Any) {
        taskViewModel.addTask(taskTitle: newTaskTxtField.text!)
        taskViewModel.getTask()
    }
}

