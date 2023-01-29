//
//  ViewController.swift
//  RealmToDoList
//
//  Created by engin gülek on 29.01.2023.
//

import UIKit
import RxSwift
import RxCocoa
class HomePageViewController: UIViewController {

    @IBOutlet weak var newTaskTxtField: UITextField!
    @IBOutlet weak var taskTableViewController: UITableView!
    private let disposeBag = DisposeBag()
    @IBOutlet weak var addTaskButton: UIButton!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        let newTaskValid = newTaskTxtField
            .rx
            .text
            .orEmpty
            .map{$0.count >= 8}
            .debug("newTaskValid",trimOutput: true)
            .share()
            .throttle(.milliseconds(100), scheduler: MainScheduler.instance)

        
        newTaskValid
            .bind(to: addTaskButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        configureTableView()
        //taskViewModel.getTaskTest()
      //  taskViewModel.getTaskTest1()
       
        taskTableViewController.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "taskCell")
    
        TaskListViewModel.taskListModel.getTask()
            .bind(to: taskTableViewController.rx
              .items(cellIdentifier: "taskCell", cellType: TaskTableViewCell.self)) { row, element, cell in
                  print("Task \(element.taskText)")
            }
            .disposed(by: disposeBag)
        
        
       
        
        
        
        /*taskViewModel.getTask()
            .bind(to: taskTableViewController.rx
                .items(cellIdentifier: "taskCell", cellType: TaskTableViewCell.self)) { row, element, cell in
                    
                    print("Element \(element.taskText)")
              }
              .disposed(by: disposeBag)*/
        
        
        
      
    
        //taskViewModel.getTask()
       
        
      /* tasks = {
            .just(taskViewModel.taskList)
        }()*/
        
       /* tasks
          .bind(to: taskTableViewController
            .rx
            .items(cellIdentifier: "taskCell", cellType: TaskTableViewCell.self)) { row, element, cell in // 3
                cell.confifure(task: element)
            
          }
          .disposed(by: disposeBag)*/
          
        
        
     
            
    }
    
   

    @IBAction func addTaskAction(_ sender: Any) {
        TaskListViewModel.taskListModel.addTask(taskTitle: newTaskTxtField.text!)
        
        
    }
    
    private func configureTableView() {
        taskTableViewController.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        taskTableViewController.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        taskTableViewController.rowHeight = 104
    }
}


extension HomePageViewController {
    
}

