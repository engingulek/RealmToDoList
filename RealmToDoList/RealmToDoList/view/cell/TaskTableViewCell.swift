//
//  TaskTableViewCell.swift
//  RealmToDoList
//
//  Created by engin gülek on 29.01.2023.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var taskLabel: UILabel!
    
    func confifure(task:TaskViewModel){
        iconImageView.image = UIImage(systemName : task.completed ? "checkmark.circle" : "circle")
        taskLabel.text = task.taskText
    }
    
}
