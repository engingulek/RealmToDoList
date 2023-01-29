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
    
    /*   func numberOfRowsInSection()->Int {
        return self.taskList.count
    }
    
    func cellFromItemAt(index:Int) -> TaskViewModel{
        return taskList[index]
    }
    
    
    func changeCompleted(id:ObjectId,completed:Bool) {
        RealmManager.realManager.updateTask(id: id, completed: completed)
    }
    
    func deleteTask(id:ObjectId){
        RealmManager.realManager.deleteTask(id: id)
    }*/
    
    /*func getTaskTest(){
        RealmManager.realManager.getTasks()
        self.taskListTest = RealmManager.realManager.tasks.map(TaskViewModel.init)
      
        print(self.taskList)
        print(self.taskListTest)
    }*/
    
    /*func getTaskTest1() {
        RealmManager.realManager.getTasks()
        let list = RealmManager.realManager.tasks.map(TaskViewModel.init)
        self.taskList.accept(list)
        print(self.taskList)
    }*/
    
   
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
}
