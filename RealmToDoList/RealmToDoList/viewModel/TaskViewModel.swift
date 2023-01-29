//
//  TaskViewModel.swift
//  RealmToDoList
//
//  Created by engin gülek on 29.01.2023.
//

import Foundation

import RealmSwift
class TaskListViewModel : ObservableObject {
  @Published  var taskList : [TaskViewModel]
    
    init(){
        self.taskList = [TaskViewModel]()
    }
    
    func addTask(taskTitle:String){
        RealmManager.realManager.addTask(taskTitle: taskTitle)
        
    }
    
    func numberOfRowsInSection()->Int {
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
    }
    
    func getTask(){
        RealmManager.realManager.getTasks()
        self.taskList = RealmManager.realManager.tasks.map(TaskViewModel.init)
        print(self.taskList)
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
}
