//
//  TaskViewModel.swift
//  RealmToDoList
//
//  Created by engin gülek on 29.01.2023.
//

import Foundation
import RxSwift
import RealmSwift
import RxCocoa
class TaskListViewModel  {
    
var taskList : BehaviorRelay<[TaskViewModel]>  = .init(value: [])
    var count : BehaviorRelay<Int> = .init(value: 0)
    
  static let taskListModel = TaskListViewModel()
    
     func addTask(taskTitle:String){
        RealmManager.realManager.addTask(taskTitle: taskTitle)
         let _  = getTask()
    }
    
    func getTask() -> Observable<[TaskViewModel]>{
         RealmManager.realManager.getTasks()
        let list = RealmManager.realManager.tasks.map(TaskViewModel.init)
        self.taskList.accept(list)
        
        return self.taskList.map{$0.map{TaskViewModel(task: $0.task)}}
     }
    
    func getTaskTaskCount() -> Observable<Int>{
        
        return taskList.map { $0.count}
    }
    
    func changeCompleted(id:ObjectId,completed:Bool) {
        RealmManager.realManager.updateTask(id: id, completed: completed)
        let _  = getTask()
    }
    
    func deleteTask(id:ObjectId){
        RealmManager.realManager.deleteTask(id: id)
        let _  = getTask()
    }
}

struct TaskViewModel {
    var task:Task
    
    var id : ObjectId {
        return task.id
    }
    var taskText : String {
        return  task.title
    }
    
    var completed : Bool {
        return task.completed
    }
    var value : Int {
        return task.value
    }
}
