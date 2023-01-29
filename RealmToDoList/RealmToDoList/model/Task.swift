//
//  Task.swift
//  RealmToDoList
//
//  Created by engin gülek on 29.01.2023.
//

import Foundation
import RealmSwift

class Task : Object,ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
