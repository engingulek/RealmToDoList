//
//  TaskViewModel.swift
//  RealmToDoList
//
//  Created by engin gülek on 29.01.2023.
//

import Foundation

import RealmSwift
struct TaskListViewModel {
    var taskList : [TaskViewModel]
    
    init(){
        self.taskList = [TaskViewModel]()
    }
    
    func numberOfRowsInSection()->Int {
        return self.taskList.count
    }
    
    func cellFromItemAt(index:Int) -> TaskViewModel{
        return taskList[index]
    }
    
    
    func changeCompleted(id:ObjectId,completed:Bool) {
        
    }
    
    func deleteTask(id:ObjectId){
        
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
