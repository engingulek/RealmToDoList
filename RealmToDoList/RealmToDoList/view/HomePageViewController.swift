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
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableViewController.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "taskCell")
    }


    @IBAction func addTaskAction(_ sender: Any) {
    }
}

