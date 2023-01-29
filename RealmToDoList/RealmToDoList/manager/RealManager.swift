//
//  RealManager.swift
//  RealmToDoList
//
//  Created by engin gülek on 29.01.2023.
//

import Foundation
import RealmSwift

class RealmManager : ObservableObject {
    private(set) var localRealm : Realm?
    @Published var tasks : [Task] = []
    
    static let realManager = RealmManager()
    
    init() {
           openRealm()
       }
    
    func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm  = try Realm()
        }catch{
            print("Error opening Realm", error)
        }
    }
    
    func getTasks(){
        print("Get Task Test")
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    
    func addTask(taskTitle :String){
        if let localRealm = localRealm {
            do{
                try localRealm.write{
                    let newTask = Task(value: ["title":taskTitle, "completed" : false])
                    localRealm.add(newTask)
                    getTasks()
                    
                }
            }catch{
                print("Error adding task to Realm: \(error)")
            }
        }
    }
    
    func updateTask(id:ObjectId,completed:Bool){
        if let localRealm = localRealm{
            do{
                let taskUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskUpdate.isEmpty else {return}
                
                try localRealm.write{
                    taskUpdate[0].completed = completed
                    getTasks()
                }
            }catch{
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
        
    }
    
    
    func deleteTask(id:ObjectId){
        if let localRealm = localRealm{
            do{
                let taskDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskDelete.isEmpty else {return}
                
                try localRealm.write{
                    localRealm.delete(taskDelete)
                    getTasks()
                }
            }catch{
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
        
    }
    
}
